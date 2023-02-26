Customize = require("config.customize")

return {
	-- {{{ LuaSnip

	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},

	-- ----------------------------------------------------------------------- }}}
	-- {{{ nvim-cmp

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",

		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-path",
			"f3fora/cmp-spell",
			"saadparwaiz1/cmp_luasnip",
			dependencies = { "L3MON4D3/LuaSnip" },
		},

		opts = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local kind_icons = require("config.constants").lsp_kind_icons
			local source_mapping = require("config.constants").source_mapping
			local sources = require("config.constants").sources

			require("luasnip/loaders/from_vscode").lazy_load()

			local has_words_before = function()
				-- Deprecated. (Devined in Lua 5.1/LuaJIT, current is Lua 5.4.)
				-- But, the next line does not work without pack statement.
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			-- local check_backspace = function()
			--   local col = vim.fn.col '.' - 1
			--   return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
			-- end

			local completion = {
				keyword_length = 1,
			}

			local formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					vim_item.menu = (source_mapping)[entry.source.name]
					return vim_item
				end,
			}

			local confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}

			local experimental = {
				ghost_text = true,
				native_menu = false,
			}

			local kind_icons = require("config.constants").lsp_kind_icons

			local mapping = {
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),

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

			local snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			}

			local window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			}

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

			return {
				completion = completion,
				confirm_opts = confirm_opts,
				experimental = experimental,
				formatting = formatting,
				mapping = mapping,
				snippet = snippet,
				sources = sources,
				window = window,
			}
		end,
	},

	-- ----------------------------------------------------------------------- }}}
}
