PRIORITIES_HASH =
  ['a'..'z', 'A'..'Z']
    .flat_map(&:to_a)
    .map.with_index { | c, i | [c, i + 1] }
    .inject({}) { |h, arr| h.merge({ arr[0] =>  arr[1] }) }.freeze

File.open('./day3.txt') do |file|
  priority_sum = 0

  while !file.eof? do
    elf1 = file.readline.split('')
    elf2 = file.readline.split('')
    elf3 = file.readline.split('')

    priority_sum += PRIORITIES_HASH[(elf1 & elf2 & elf3).first]
  end

  puts priority_sum
end