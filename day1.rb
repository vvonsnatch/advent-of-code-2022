File.open('./day1.txt') do |file|
  max_elf_cals = 0
  current_elf_cals = 0

  file.each_line do |line|
    if line == "\n"
      max_elf_cals = current_elf_cals if current_elf_cals > max_elf_cals
      current_elf_cals = 0
    else
      current_elf_cals += line.to_i
    end
  end

  puts max_elf_cals
end