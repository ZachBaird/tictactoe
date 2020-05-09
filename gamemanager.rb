# frozen_string_literal: true

# *****************************************************************************
# GameManager - Stores game state for turn count, which turn it is, and the board's
#   state. Contains methods to manage game executing flow (ie. deciding turns, playing
#   a round)
class GameManager
  attr_accessor :state

  def initialize
    @state = {}
    @state[:is_x_turn] = false
    @state[:num_of_turns] = 0
    @state[:initial_board] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  # Prompts players for who starts and stores input in state
  def decide_turn
    print 'Who will be starting? [x : o]'
    user_input = gets.chomp

    @state[:is_x_turn] = user_input == 'x'
  end

  # Plays a game round. Prompts user for position choice and continues round if
  #   choice is valid
  def play
    puts "Alright, player #{@state[:is_x_turn] ? 'X' : 'O'} here is the board:"
    BoardUI.print_board(@state[:initial_board])

    puts "Blank spaces are valid positions. What position would you like to play?
          Here is a list of options:"
    @state[:initial_board].each_with_index do |position, index|
      print " - #{index + 1} - " if position.nil?
    end

    print "\n Input decision: "
    user_choice = gets.chomp

    if valid_move?(user_choice)
      @state[:initial_board][user_choice.to_i - 1] = @state[:is_x_turn] ? 'x' : 'o'
      @state[:num_of_turns] += 1
      @state[:is_x_turn] = !@state[:is_x_turn]
    end
  end

  # Tests if user input is valid
  def valid_move?(choice)
    if choice == '' ||
       !@state[:initial_board][choice.to_i - 1].nil? ||
       choice.to_i > @state[:initial_board].length
      return false
    end

    true
  end
end
# *****************************************************************************
