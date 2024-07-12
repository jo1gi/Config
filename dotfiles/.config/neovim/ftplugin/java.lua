-- local workspace_dir = vim.fn.getcwd() .. '/jdtls-workspace'
-- -- local workspace_dir = '.jdtls-workspaces/' .. project_name

-- local config = {
--     cmd = {'jdtls', '-data', workspace_dir},
--     root_dir = require('jdtls.setup').find_root({'.git'}),
-- }
-- require('jdtls').start_or_attach(config)
local config = {
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
