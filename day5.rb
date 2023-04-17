
FILENAME='day5_sample.txt'

lines = File.open(FILENAME).readlines.map(&:chomp)

# find index of line that lists the stacks
stackIndex = nil
lines.each_with_index do |line, index|
  if line =~ /(\s+\d)+/
    stackIndex = index
    break
  end
end

numStacks = lines[stackIndex].delete(' ').size

# list of stacks
stacks = []
numStacks.times do
  stacks << []
end

# construct stacks
i = stackIndex - 1
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

# move stack items
instructions = lines[(stackIndex + 2)...lines.size]
puts instructions





puts "#{stacks[0]}"
puts "#{stacks[1]}"
puts "#{stacks[2]}"
puts "#{stacks[3]}"
puts "#{stacks[4]}"
puts "#{stacks[5]}"
puts "#{stacks[6]}"
puts "#{stacks[7]}"
puts "#{stacks[8]}"

