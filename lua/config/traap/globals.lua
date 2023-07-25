-- My plugin customizations reuire the following global values.

Constants = require("config.traap.constants")
Customize = require("config.traap.customize")

Is_Enabled = require("config.traap.functions").is_enabled
In_Tmux = require("config.traap.functions").in_tmux

Keymap = require("config.traap.functions").keymap

Use_Default_Opts =   require("config.traap.functions").use_default_opts
Use_Default_Config = require("config.traap.functions").use_default_config
Use_Default_Keys =   require("config.traap.functions").use_default_keys

Page_Viewer =   require("config.traap.functions").page_viewer
