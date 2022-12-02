File.open('./day1_sample.txt') do |file|
  max_elf_cals = 0
  current_elf_cals = 0

  file.each_line do |line|
    current_elf_cals = line == "\n" ? 0 : current_elf_cals + line.to_i

    max_elf_cals = current_elf_cals if current_elf_cals > max_elf_cals
  end

  puts max_elf_cals
end