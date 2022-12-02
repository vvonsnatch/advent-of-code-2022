OUTCOMES = {
  'X' => 0, # You Lose
  'Y' => 3, # Draw
  'Z' => 6 # You Win
}.freeze

SHAPE_SCORE = {
  'Rock' => 1,
  'Paper' => 2,
  'Scissors' => 3
}

REQUIRED_MOVES = {
  'A' => { # They play Rock
    'X' => 'Scissors', # To lose, you play Scissors
    'Y' => 'Rock', # To draw, you play Rock
    'Z' => 'Paper', # To win, you play Paper
  },
  'B' => { # They play Paper
    'X' => 'Rock', # To lose, you play Rock
    'Y' => 'Paper', # To draw, you play Paper
    'Z' => 'Scissors', # To win, you play scissors
  },
  'C' => { # They play Scissors
    'X' => 'Paper', # to lose, you play paper
    'Y' => 'Scissors', # to draw, you play scissors
    'Z' => 'Rock', # to win, you play Rock
  }
}

File.open('./day2.txt') do |file|
  myScore = 0

  file.each_line do |line|
    theirMove, requiredOutcome = line.split(' ')

    myMove = REQUIRED_MOVES[theirMove][requiredOutcome]

    myScore += OUTCOMES[requiredOutcome] + SHAPE_SCORE[myMove]
  end

  puts myScore
end