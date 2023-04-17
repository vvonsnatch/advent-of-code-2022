# construct stacks
FILENAME='day5.txt'

lines = File.open(FILENAME).readlines.map(&:chomp)

stackIndex = nil

lines.each_with_index do |line, index|
  if line =~ /(\s+\d)+/
    stackIndex = index
    break
  end
end

numStacks = lines[stackIndex].delete(' ').size

puts "NUM STACKS: #{numStacks}"