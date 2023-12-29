return {
  "HakonHarnes/img-clip.nvim",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},

  opts = {
    default = {
      debug = false,

      -- YouTube: 1st - Adjust dir_path
      dir_path = function()
        return "images/" .. vim.fn.expand("%:t:r")
      end,

      file_name = "%Y-%m-%d-%H-%M-%S",
      url_encode_path = false,
      use_absolute_path = false,

      -- YouTube: 2nd - Toggle relative_to_current_file.
      relative_to_current_file = true,
      prompt_for_file_name = true,

      -- YouTube: 3rd - Toggle show_dir_path_in_prompt
      show_dir_path_in_prompt = true,

      use_cursor_in_template = false,
      insert_mode_after_paste = true,
      embed_image_as_base64 = false,
      max_base64_size = 10,
      template = "$FILE_PATH",

      -- YouTube: 4th - Toggle show_dir_path_in_prompt
      drag_and_drop = {
        enabled = false,
        insert_mode = true,
        copy_images = true,
        download_images = true,
      },
    },


    -- YouTube: 0th - Quickly cover file types.
    asciidoc = {
      template = 'image::$FILE_PATH[width=80%, alt="$CURSOR"]',
    },

    html = {
      template = '<img src="$FILE_PATH" alt="$CURSOR">',
    },

    markdown = {
      url_encode_path = true,
      template = "![$CURSOR]($FILE_PATH)",
    },

    org = {
      template = [=[
      #+BEGIN_FIGURE
      [[file:$FILE_PATH]]
      #+CAPTION: $CURSOR
      #+NAME: fig:$LABEL
      #+END_FIGURE
      ]=],
    },

    rst = {
      template = [[
      .. image:: $FILE_PATH
      :alt: $CURSOR
      :width: 80%
      ]],
    },

    tex = {
      template = [[
      \begin{figure}[h]
      \centering
      \includegraphics[width=0.8\textwidth]{$FILE_PATH}
      \caption{$CURSOR}
      \label{fig:$LABEL}
      \end{figure}
      ]],
    },

    typst = {
      template = [[
      #figure(
      image("$FILE_PATH", width: 80%),
      caption: [$CURSOR],
      ) <fig-$LABEL>
      ]],
    },

    wiki = {
      url_encode_path = true,
      template = "![$CURSOR]($FILE_PATH)",
    },

  },

  keys = {
    {"<leader>pi", "<cmd>PasteImage<cr>", desc = "Save and Paste Image"},
  },
}
