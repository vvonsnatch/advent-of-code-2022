def covers?(range1_start, range1_end, range2_start, range2_end)
  range1_start <= range2_start && range1_end >= range2_end
end

def overlaps?(range1_start, range1_end, range2_start, range2_end)
  if range1_start <= range2_start
    range1_end >= range2_start
  elsif range1_start >= range2_start
    range2_end >= range1_start
  else
    false
  end
end

File.open('./day4.txt') do |file|
  num_covered_sets = 0

  file.each_line do |line|
    range1, range2 = line.split(',')
    range1_start, range1_end = range1.split('-').map(&:to_i)
    range2_start, range2_end = range2.split('-').map(&:to_i)
    num_covered_sets += 1 if overlaps?(range1_start, range1_end, range2_start, range2_end)
  end

  puts num_covered_sets
end


