-- configure plugins
require('plugins.config.vimplugs')
local packer_module = require('plugins.packer')
packer_module.load_plugins()
-- load plugin configurations
require('plugins.config')
