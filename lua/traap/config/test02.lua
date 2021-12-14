print('-- Test with t2')
local t2 = {
  {'a', 'b', 'c', 'd', 'e'},
  {'0', '1', '2', '3', '4'},
}

for k0, v0 in pairs(t2) do
  for k1, v1 in pairs(v0) do
    print('-- ', k0, k1, v1)
  end
  print()
end

-- Test output below using r!lua test.lua

