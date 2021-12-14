print('-- test with language_servers')
local language_servers = {
  {other = 'bar', server = 'solargraph',   command='ruby'},
  {server = 'bashls',       command='bash'},
  {server = 'cssls',        command='ccls'},
  {server = 'diagnosticls', command='diagnostcls'},
  {server = 'html',         command='html'},
  {server = 'jsonls',       command='jsonls'},
  {server = 'emmet_ls',     command='ement_ls'},
  {server = 'texlab',       command='latex'},
  {server = 'tsserver',     command='tsserver', other = 'abc'},
  {other = 'foo', server = 'yamlls',       command='yaml'},
}

local command, other, server = 'na', 'na', 'na'

for _, v0 in pairs(language_servers) do
  command, other, server = 'na', 'na', 'na'
  for k1, v1 in pairs(v0) do
    if k1 == 'server' then
      server = v1
    elseif k1 == 'command' then
      command = v1
    elseif k1 == 'other' then
      other = v1
    end
  end
  print('--  server: ' .. server .. ' command: ' .. command  .. ' other: ' .. other .. '\n')
end

-- Test output below using r!lua test05.lau

