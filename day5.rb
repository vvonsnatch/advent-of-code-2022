BOX_CHAR_SIZE = 3

def print_stacks(stacks, level)
  puts "LEVEL: #{level}"
  puts "stack 1: #{stacks[0]}"
  puts "stack 2: #{stacks[1]}"
  puts "stack 3: #{stacks[2]}"
  puts "stack 4: #{stacks[3]}"
  puts "stack 5: #{stacks[4]}"
  puts "stack 6: #{stacks[5]}"
  puts "stack 7: #{stacks[6]}"
  puts "stack 8: #{stacks[7]}"
  puts "stack 9: #{stacks[8]}"
end

File.open('day5.txt') do |file|
  stackIndex = 0
  boxesLineSize = nil

  lines = file.readlines
  lines.each do |line|
    if line =~ /(\s+\d)+/
      boxesLineSize = line.size + 1
      break
    end
    stackIndex += 1
  end

  # construct the stacks
  stacks = []
  stackLineWithoutBlanks = lines[stackIndex].gsub(/[[ ]]/,'')[0..-2]
  numStacks = stackLineWithoutBlanks.size ## CAVEAT - ONLY WORKS FOR 9 SINGLE DIGIT LABELLED STACKS
  numStacks.times { stacks << [] }

  puts "STACK INDEX: #{stackIndex}"
  puts "NUM STACKS: #{numStacks}"


  #   read up one line at a time to populate the stacks
  (stackIndex - 1 ).downto(0).each do |i|
    boxes = lines[i]

    j = 0
    while j < boxesLineSize
      box_label = boxes[(j+1)...(j+2)]
      puts "BOX LABEL: #{box_label}"
      puts "#{j} / #{BOX_CHAR_SIZE} = #{j / BOX_CHAR_SIZE}"
      puts "stacks[#{j / BOX_CHAR_SIZE}]: #{stacks[j / BOX_CHAR_SIZE]}"
      puts
      stacks[j / BOX_CHAR_SIZE] << box_label
      j += BOX_CHAR_SIZE + 1
    end

    print_stacks(stacks, stackIndex - i)
  end

  stacks = stacks.map { |stack| (stack - [" "]).compact }



  # parse each line after the stacks to move things
  #   x times: pop 1 from a and add 1 to b
  # iterate over all of the stacks and get the topmost item




end