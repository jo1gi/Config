local workspace_dir = vim.fn.getcwd() .. 'jdtls-workspace'

local config = {
    cmd = {'jdt-language-server', '-data', workspace_dir},
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
}
require('jdtls').start_or_attach(config)
