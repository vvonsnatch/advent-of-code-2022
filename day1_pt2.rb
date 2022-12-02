File.open('./day1.txt') do |file|
  top_3_elf_cals = []
  current_elf_cals = 0

  file.each_line do |line|
    current_elf_cals += line.to_i

    if line == "\n" || file.eof?
      top_3_elf_cals << current_elf_cals
      top_3_elf_cals.sort!
      top_3_elf_cals.shift if top_3_elf_cals.size > 3

      current_elf_cals = 0
    end
  end

  puts top_3_elf_cals.sum
end