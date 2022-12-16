local  ok, project = pcall(require, 'project_nvim')
if not ok then return end

project.setup()
