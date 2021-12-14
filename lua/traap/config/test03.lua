print('-- Test with t3')
local t3 = {
  {letter = 'g', number = '7', other = '#'},
  {number = '8',  other = '$', letter = 'h'},
  {other  = '%', letter = 'i', number = '9'},
}

for k0, v0 in pairs(t3) do
  for k1, v1 in pairs(v0) do
    print('--', k0, k1, v1)
  end
  print()
end

-- Test output below using r!lua test.lua

