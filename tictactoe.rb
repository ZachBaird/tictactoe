# *****************************************************************************
# Board UI
class BoardUI
  # Class method. Takes an array and prints out the board populating the values.
  def self.print_board(board)
    puts "-------"
    print "|"

    board.each_with_index do |position, index|
      if position.nil?
        print " |"
      else
        print "#{position}|"
      end

      if (index + 1) % 3 == 0 && index + 1 != board.length
        puts "\n"
        puts "-------"
        print "|"
      elsif index + 1 == board.length
        puts "\n"
        puts "-------"
      end
    end
  end
end
# *****************************************************************************


# *****************************************************************************
# GameManager
class GameManager
  attr_accessor :state
  def initialize
    @state = Hash.new
    @state[:is_x_turn] = false
    @state[:num_of_turns] = 0
    @state[:initial_board] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def decide_turn
    print "Who will be starting? [x : o]"
    user_input = gets.chomp

    user_input == "x" ? @state[:is_x_turn] = true : @state[:is_x_turn] = false
  end

  def play
    puts "Alright, player #{@state[:is_x_turn] ? "X" : "O"} here is the board:"
    BoardUI.print_board(@state[:initial_board])

    puts "Blank spaces are valid positions. What position would you like to play? 
          Here is a list of options:"    
    @state[:initial_board].each_with_index do |position, index|
      if position.nil?
        print " - #{index + 1} - "
      end
    end

    print "\n Input decision: "
    user_choice = gets.chomp

    unless user_choice == "" || !@state[:initial_board][user_choice.to_i - 1].nil? || user_choice.to_i > @state[:initial_board].length
      @state[:initial_board][user_choice.to_i - 1] = @state[:is_x_turn] ? "x" : "o"
      @state[:num_of_turns] += 1
      @state[:is_x_turn] = !@state[:is_x_turn]
    else
      print "\nThat was an illegal move!\n\n"
    end
  end
end
# *****************************************************************************


# *****************************************************************************
# RefereeManager
class RefereeManager
  def self.check_game(array, num_of_turns)
    if num_of_turns == array.length
      puts "Game over.."
      false
    else
      winner = test_for_winning_combo(array)

      if winner
        puts "WE HAVE A WINNER!"
      end
      
      if winner
        false
      else
        true
      end
    end
  end

  def self.test_for_winning_combo(array)
    if (array[0] == array[1] && array[1] == array[2] && !array[0].nil?) ||
      (array[3] == array[4] && array[4] == array[5] && !array[3].nil?) ||
      (array[6] == array[7] && array[7] == array[8] && !array[6].nil?) ||
      (array[0] == array[3] && array[3] == array[6] && !array[0].nil?) ||
      (array[1] == array[4] && array[4] == array[7] && !array[1].nil?) ||
      (array[2] == array[5] && array[5] == array[8] && !array[2].nil?) ||
      (array[0] == array[4] && array[4] == array[8] && !array[0].nil?) ||
      (array[2] == array[4] && array[4] == array[6] && !array[2].nil?) 
      true
    else
      false
    end
  end
end
# *****************************************************************************


# *****************************************************************************
# Main
in_play = true
game = GameManager.new

puts "Here is the starting board: "
BoardUI.print_board(game.state[:initial_board])

game.decide_turn

while in_play
  game.play
  in_play = RefereeManager.check_game(game.state[:initial_board], game.state[:num_of_turns])
end

# This is reverse due to the current game logic.
winner = game.state[:is_x_turn] ? "o" : "x"

puts "The game is over. #{winner} has won! Here is the result:\n"
BoardUI.print_board(game.state[:initial_board])
#******************************************************************************