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

-- Test output below using r!lua test03.lua

-- Test with t3
--	1	other	#
--	1	letter	g
--	1	number	7

--	2	letter	h
--	2	number	8
--	2	other	$

--	3	number	9
--	3	other	%
--	3	letter	i
