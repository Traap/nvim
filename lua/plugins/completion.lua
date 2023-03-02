Constants = require("config.constants")
Customize = require("config.customize")
Is_Enabled = require("config.functions").is_enabled

return {
	-- {{{ nvim-cmp
	--     TODO: Try to improve nexted folds behavior.

	{
		-- {{{ Events and dependencies

		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		enabled = Is_Enabled("nvim-cmp"),

		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"f3fora/cmp-spell",
			"saadparwaiz1/cmp_luasnip",
		},

		-- --------------------------------------------------------------------- }}}
		-- {{{ opts function overfides LazyVim default behavior.

		opts = function(_, opts)
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- ------------------------------------------------------------------- }}}
			-- {{{ has_words_before function
			--     Determines when words are present before the cursor.
			--     <Tab> and <S-Tab> m

			local has_words_before = function()
				-- Deprecated. (Defined in Lua 5.1/LuaJIT, current is Lua 5.4.)
				-- But, the next line does not work without pack statement.
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			-- ------------------------------------------------------------------- }}}
			-- {{{ Completion length and keywords.

			local completion = {
				completeopt = "menu,nenuone,noinsert",
				keyword_length = 1,
			}

			-- ------------------------------------------------------------------- }}}
			-- {{{ Formatting fileds, icons, and source_mapping

			local formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s", Constants.icons.lsp_kinds[vim_item.kind])
					vim_item.menu = (Constants.completion.source_mapping)[entry.source.name]
					return vim_item
				end,
			}

			-- ------------------------------------------------------------------- }}}
			-- {{{ Confirmaiton option

			local confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}

			-- ------------------------------------------------------------------- }}}
			-- {{{ keybind mappings

			local mapping = {
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

				["<C-y>"] = cmp.config.disable,

				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),

				-- Do not explicitly select 'first' item when nothing is selected.
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				-- Next
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				-- Previoius
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}

			-- ------------------------------------------------------------------- }}}
			-- {{{ Add boarders to completion windows.

			local window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			}

			-- ------------------------------------------------------------------- }}}
			-- {{{ Setup filetype and cmdline preferences.

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "cmp_git" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			-- ------------------------------------------------------------------- }}}
			-- {{{ Update the function argument opts with local choices made.

			opts.completion = completion
			opts.confirm_opts = confirm_opts
			opts.formatting = formatting
			opts.mapping = mapping
			opts.sources = Constants.completion.sources
			opts.window = window

			-- ------------------------------------------------------------------- }}}
		end,
	},

	-- ----------------------------------------------------------------------- }}}
}
