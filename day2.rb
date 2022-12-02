
SHAPE_SCORE = {
  'X' => 1, # Rock
  'Y' => 2, # Paper
  'Z' => 3 # Scissors
}.freeze

OUTCOME_SCORE = {
  'A' => {
    'X' => 3,  # Rock vs Rock: You Draw
    'Y' => 6,  # Rock vs Paper: You Win
    'Z' => 0,  # Rock vs Scissors: You Lose
  },
  'B' => {
    'X' => 0,  # Paper vs Rock: You Lose
    'Y' => 3,  # Paper vs Paper: You Draw
    'Z' => 6,  # Paper vs Scissors: You Win
  },
  'C' => {
    'X' => 6,  # Scissors vs Rock: You Win
    'Y' => 0,  # Scissors vs Paper: You Lose
    'Z' => 3,  # Scissors vs Scissors: You Draw
  }
}.freeze

File.open('./day2.txt') do |file|
  myScore = 0

  file.each_line do |line|
    theirMove, myMove = line.split(' ')

    myScore += SHAPE_SCORE[myMove] + OUTCOME_SCORE[theirMove][myMove]
  end

  puts myScore
end
