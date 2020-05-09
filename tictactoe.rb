# frozen_string_literal: true

require_relative 'board'
require_relative 'gamemanager'
require_relative 'referee'

# Methods
def output_results(winner)
  if winner
    # This is reverse due to the current game logic
    winning_player = game.state[:is_x_turn] ? 'o' : 'x'

    puts "The game is over. #{winning_player} has won! Here is the result:\n"
    BoardUI.print_board(game.state[:initial_board])
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
BoardUI.print_board(game.state[:initial_board])

# Decide which player starts the game
game.decide_turn

# Game loop
while in_play && !winner
  game.play
  system('clear')
  in_play = RefereeManager.check_game?(game.state[:initial_board],
                                       game.state[:num_of_turns]) { |winner_exists| winner = winner_exists }
end

output_results(winner)
