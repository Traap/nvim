return {
  "HakonHarnes/img-clip.nvim",
  enabled = true,
  cmd = "PasteImage",
  opts = {
    -- directory path to save images to, can be relative (cwd or current file)
    -- or absolute
    dir_path = "images",

    -- file name format (see lua.org/pil/22.1.html)
    file_name = "%Y-%m-%d-%H-%M-%S",

    -- encode spaces and special characters in file path
    url_encode_path = false,

    -- expands dir_path to an absolute path
    use_absolute_path = false,

    -- ask user for file name before saving, leave empty to use default
    prompt_for_file_name = true,

    -- show dir_path in prompt when prompting for file name
    show_dir_path_in_prompt = false,

    -- jump to cursor position in template after pasting
    use_cursor_in_template = true,

    -- enter insert mode after pasting the markup code
    insert_mode_after_paste = true,

    -- make dir_path relative to current file rather than the cwd
    relative_to_current_file = false,

    -- embed image as base64 string instead of saving to file
    embed_image_as_base64 = false,

    -- max size of base64 string in KB
    max_base64_size = 10,

    -- default template
    template = "$FILE_PATH",

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
