# frozen_string_literal: true

require_relative 'gamestate'

# *****************************************************************************
# GameManager - Stores game state for turn count, which turn it is, and the board's
#   state. Contains methods to manage game executing flow (ie. deciding turns, playing
#   a round)
class GameManager
  attr_accessor :state

  def initialize
    @state = GameState.new

  end

  # Prompts players for who starts and stores input in state
  def decide_turn
    print 'Who will be starting? [x : o]'
    user_input = gets.chomp

    @state.assign_turn(user_input)
  end

  # Plays a game round. Prompts user for position choice and continues round if
  #   choice is valid
  def play
    puts "Alright, player #{@state.get_turn} here is the board:"
    BoardUI.print_board(@state.get_board)

    puts "Blank spaces are valid positions. What position would you like to play?
          Here is a list of options:"
    @state.get_board
          .each_with_index do |position, index|
      print " - #{index + 1} - " if position.nil?
    end

    print "\n Input decision: "
    user_choice = gets.chomp

    if valid_move?(user_choice)
      @state.set_spot(user_choice.to_i)
      @state.increment_turn_count
      @state.change_turn
    end
  end

  # Tests if user input is valid
  def valid_move?(choice)
    if choice == '' ||
       !@state.get_board[choice.to_i - 1].nil? ||
       choice.to_i > @state.get_board.length
      return false
    end

    true
  end
end
# *****************************************************************************
