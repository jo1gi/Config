-- local workspace_dir = vim.fn.getcwd() .. '/jdtls-workspace'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/jo1gi/.local/share/jdtls-workspaces/' .. project_name

local config = {
    cmd = {'jdtls', '-data', workspace_dir},
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'pom.xml'}),
}
require('jdtls').start_or_attach(config)
