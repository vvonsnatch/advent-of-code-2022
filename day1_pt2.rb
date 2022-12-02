File.open('./day1.txt') do |file|
  top_3_elf_cals = []
  current_elf_cals = 0

  file.each_line do |line|
    if line == "\n"

      if top_3_elf_cals.size < 3
        top_3_elf_cals << current_elf_cals
      else
        if top_3_elf_cals.any? { |elf_cal| elf_cal < current_elf_cals }
          top_3_elf_cals.shift
          top_3_elf_cals << current_elf_cals
        end
      end


      top_3_elf_cals.sort!
      current_elf_cals = 0
    else
      current_elf_cals += line.to_i
    end
  end

  puts top_3_elf_cals.sum
end