-- My plugin customizations require the following global values.

Constants = require("traap.core.constants")
Customize = require("traap.config.customize")

Is_Enabled = require("traap.core.functions.plugins").is_enabled
In_Tmux = require("traap.core.functions.plugins").in_tmux

Keymap = require("traap.core.functions.keymap").keymap

Page_Viewer =   require("traap.core.functions.wiki").page_viewer

ToggleTerm = require("traap.core.functions.toggleterm")
