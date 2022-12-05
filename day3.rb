PRIORITIES_HASH =
  ['a'..'z', 'A'..'Z']
    .flat_map(&:to_a)
    .map.with_index { | c, i | [c, i + 1] }
    .inject({}) { |h, arr| h.merge({ arr[0] =>  arr[1] }) }.freeze



File.open('./day3.txt') do |file|
  priority_sum = 0

  file.each_line do |line|
    compartment1, compartment2 = line[0...(line.size/2)], line[(line.size/2...line.size)]

    letter = (compartment1.split('') & compartment2.split('')).first
    puts "LETTER: #{letter}"
    priority_sum += PRIORITIES_HASH[letter]
  end

  puts priority_sum
end