-- My plugin customizations reuire the following global values.

Constants = require("config.traap.constants")
Customize = require("config.traap.customize")

Is_Enabled = require("config.traap.functions.plugins").is_enabled
In_Tmux = require("config.traap.functions.plugins").in_tmux

Keymap = require("config.traap.functions.keymap").keymap

Use_Default_Opts =   require("config.traap.functions.plugins").use_default_opts
Use_Default_Config = require("config.traap.functions.plugins").use_default_config
Use_Default_Keys =   require("config.traap.functions.plugins").use_default_keys

Page_Viewer =   require("config.traap.functions.wiki").page_viewer

ToggleTerm = require("config.traap.functions.toggleterm")
