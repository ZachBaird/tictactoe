# frozen_string_literal: true

# *****************************************************************************
# GameManager
class GameManager
  attr_accessor :state
  def initialize
    @state = {}
    @state[:is_x_turn] = false
    @state[:num_of_turns] = 0
    @state[:initial_board] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def decide_turn
    print 'Who will be starting? [x : o]'
    user_input = gets.chomp

    @state[:is_x_turn] = user_input == 'x'
  end

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

    if user_choice == '' || !@state[:initial_board][user_choice.to_i - 1].nil? || user_choice.to_i > @state[:initial_board].length
      print "\nThat was an illegal move!\n\n"
    else
      @state[:initial_board][user_choice.to_i - 1] = @state[:is_x_turn] ? 'x' : 'o'
      @state[:num_of_turns] += 1
      @state[:is_x_turn] = !@state[:is_x_turn]
    end
  end
end
# *****************************************************************************
