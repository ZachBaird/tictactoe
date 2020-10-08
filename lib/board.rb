# frozen_string_literal: true

# Handles the board's UI state
class Board
  def initialize
    @board = " | |\n-----\n | |\n-----\n | |"
  end

  def current_board
    @board
  end

  def update_board(new_data)
    return @board unless valid? new_data

    # Split this up for brevity
    first_row = "#{parse(new_data[0])}|#{parse(new_data[1])}|#{parse(new_data[2], true)}"
    second_row = "#{parse(new_data[3])}|#{parse(new_data[4])}|#{parse(new_data[5], true)}"
    third_row = "#{parse(new_data[6])}|#{parse(new_data[7])}|#{parse(new_data[8], true)}"

    @board = "#{first_row}\n-----\n#{second_row}\n-----\n#{third_row}"
  end

  private

  def parse(board_spot, eol = false)
    return ' ' if board_spot.nil? && !eol
    return '' if board_spot.nil? && eol

    board_spot
  end

  def valid?(new_data = nil)
    if new_data.nil? || new_data.any?(Integer) || 
       [true, false].include?(new_data) || new_data.empty? ||
       new_data.length != 9
      false
    else
      true
    end
  end
end
