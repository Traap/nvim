-- My plugin customizations require the following global values.

Constants = require("traap.core.constants")
Customize = require("traap.config.customize")

Is_Enabled = require("traap.core.functions.plugins").is_enabled
In_Tmux = require("traap.core.functions.plugins").in_tmux

Keymap = require("traap.core.functions.keymap").keymap

Use_Default_Opts =   require("traap.core.functions.plugins").use_default_opts
Use_Default_Config = require("traap.core.functions.plugins").use_default_config
Use_Default_Keys =   require("traap.core.functions.plugins").use_default_keys

Page_Viewer =   require("traap.core.functions.wiki").page_viewer

ToggleTerm = require("traap.core.functions.toggleterm")
