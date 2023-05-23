# frozen_string_literal: true

require_relative 'referee'
require_relative 'board'

# Manages the game loop
class GameManager
  def initialize
    @x_turn = true
    @board = Board.new
    @referee = Referee.new
    @board_data = [nil, nil, nil, nil, nil, nil, nil, nil, nil]

    puts "Welcome to Tic Tac Toe!\n"
    puts "Player X is first, the positions are numbered 0 through 8, and here is the starting board:\n"
    puts @board.current_board
    puts "\nAre you ready to start?: (Y:N)"
  end

  def play
    game_finished = false

    until game_finished
      system('clear')

      choice = get_input

      move = if @x_turn
               Move.new('x', choice)
             else
               Move.new('o', choice)
             end

      @referee.play move

      @board_data[move.pos] = move.player if @board_data[move.pos].nil?
      @board.update_board @board_data

      if @referee.winner?
        puts 'We have a winner! Winner is ' << @referee.winner
        puts "Here is the board after victory:\n"
        puts @board.current_board
        game_finished = true
      else
        puts "Nice! Here is the board, now:\n"
        puts @board.current_board
        puts "\n Press Enter to continue.."
        @x_turn = !@x_turn
        gets.chomp
      end
    end
  end

  private

  def get_input
    valid_input = false
    choice = -1

    if @x_turn
      puts 'Player X, pick your position: '
    else
      puts 'Player Y, pick your position: '
    end

    until valid_input
      choice = gets.chomp

      puts choice

      position_free = (@board_data[choice.to_i]).nil?
      valid_integer = (0..8).to_a.include? choice.to_i

      if valid_integer && position_free
        valid_input = true
      else
        puts 'Invalid choice..'

        if @x_turn
          puts 'Player X, pick your position: '
        else
          puts 'Player Y, pick your position: '
        end
      end
    end

    choice.to_i
  end
end
