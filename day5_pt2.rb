def print_stacks(stacks)
  stacks.each do |stack|
    puts "#{stack}"
  end
  puts
  puts
end


FILENAME='day5.txt'.freeze

lines = File.open(FILENAME).readlines.map(&:chomp)

# find index of line that lists the stacks
stackIndexLine = nil
lines.each_with_index do |line, index|
  if line =~ /(\s+\d)+/
    stackIndexLine = index
    break
  end
end
puts "STACK INDEX: #{stackIndexLine}"

numStacks = lines[stackIndexLine].delete(' ').size

# list of stacks
stacks = []
numStacks.times do
  stacks << []
end

# construct stacks
i = stackIndexLine - 1
while i >= 0 do
  stackElementIndex = 1
  stackIndex = 0
  numStacks.times do
    stackElement = lines[i][stackElementIndex]
    stacks[stackIndex] << stackElement unless stackElement == " " || stackElement.nil?
    stackIndex += 1
    stackElementIndex += 4
  end
  i -= 1
end

print_stacks(stacks)

# move stack items
instructions = lines[(stackIndexLine + 2)...lines.size]
instructions.each do |line|
  splitLine = line.split(" ")
  els = stacks[splitLine[3].to_i - 1].pop(splitLine[1].to_i)
  stacks[splitLine[5].to_i - 1] = stacks[splitLine[5].to_i - 1].concat(els)

  puts line
  print_stacks(stacks)
end

puts "#{stacks.map { |stack| stack[-1] }.join('')}"



