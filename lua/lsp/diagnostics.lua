-- Replace the default lsp diagnostic letters with prettier symbols

local sign_define = vim.fn.sign_define

sign_define("LspDiagnosticsSignError", 
            {text = "", numhl = "LspDiagnosticsDefaultError"})

sign_define("LspDiagnosticsSignWarning", 
            {text = "", numhl = "LspDiagnosticsDefaultWarning"})

sign_define("LspDiagnosticsSignInformation", 
           {text = "", numhl = "LspDiagnosticsDefaultInformation"})

sign_define("LspDiagnosticsSignHint", 
           {text = "", numhl = "LspDiagnosticsDefaultHint"})
