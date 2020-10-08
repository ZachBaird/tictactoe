# frozen_string_literal: true

require_relative 'board'
require_relative 'gamemanager'
require_relative 'referee'

# Methods

# Determines what output to end the game with based on whether a winner exists
def output_results(winner, winning_player)
  if winner
    puts "The game is over. #{winning_player} has won!"
  else
    puts 'Game over, no winner!!'
  end
end

# Main
winner = false
in_play = true

# Instantiate game manager object
game = GameManager.new

# Print starting board
puts 'Here is the starting board: '
BoardUI.print_board(game.state.get_board)

# Decide which player starts the game
game.decide_turn

# Game loop
while in_play && !winner
  game.play
  system('clear')
  in_play = RefereeManager.check_game?(game.state.get_board,
                                       game.state.get_turn) { |winner_exists| winner = winner_exists }
end

output_results(winner, game.state.get_turn ? 'o' : 'x')
