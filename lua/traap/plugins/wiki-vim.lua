return {
  "lervag/wiki.vim",
  enabled = true,

  cmd = { "WikiIndex", "WikiJournal" },
  ft = { "wiki", "md" },

  keys = function()
    local wikihome = os.getenv("WIKIHOME")
    local workhome = os.getenv("WORKHOME")
    local   ythome = os.getenv("YOUTUBEHOME")
    local keys = {
      {"<leader>pw",
        "<cmd>edit " .. wikihome .. "/index.md<cr>",
        desc = "Personal Wiki"
      },

      {"<leader>wb",
        "<cmd>edit " ..  wikihome .. "/journal/Backlog.md<cr>",
        desc = "Wiki Backlog"
      },

      {"<leader>wa",
        "<cmd>edit " .. wikihome .. "/journal/Acronyms.md<cr>",
        desc = "Wiki Acronyms"
      },

      {"<leader>wk",
        "<cmd>edit " .. workhome .. "/Wiki/index.md<cr>",
        desc = "Work Wiki"
      },

      {"<leader>yt",
        "<cmd>edit " .. ythome .. "/wiki/index.md<cr>",
        desc = "YouTube Wiki"
      },

      {"<leader>we",
        "<cmd>WikiExport<cr>",
        desc = "Wiki Export"
      },

      {"<leader>wi",
        "<cmd>edit " .. wikihome .. "/index.md<cr>",
        desc = "Personal Wiki"
      },

      {"<leader>wj",
        "<cmd>cd ".. wikihome .."<cr><cmd>WikiJournal<cr>",
        desc = "Wiki Journal"
      },

      {"<leader>wp",
        "<cmd>WikiFzfPages<cr>",
        desc = "Wiki FzF Pages"
      },

      {"<leader>wv",
        "<cmd>lua Page_Viewer()<cr>",
        desc = "Wiki View Exported Page"
      }
    }
    return keys
  end,
}
