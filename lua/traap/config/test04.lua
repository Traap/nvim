print('-- Test with t4')
local t4 = {
  {letter = 'g', number = '7', other = '#'},
  {number = '8',  other = '$', letter = 'h'},
  {other  = '%', letter = 'i', number = '9'},
}

for k0, v0 in pairs(t4) do
  for k1, v1 in pairs(v0) do
    print('--', k0, k1, v1)
  end
  print()
end

-- Test output below using r!lua test04.lua

-- Test with t4
--	1	letter	g
--	1	number	7
--	1	other	#

--	2	other	$
--	2	number	8
--	2	letter	h

--	3	other	%
--	3	number	9
--	3	letter	i

