# frozen_string_literal: true

# *****************************************************************************
# Board UI
class BoardUI
  # Class method. Takes an array and prints out the board populating the values.
  def self.print_board(board)
    puts '-------'
    print '|'

    board.each_with_index do |position, index|
      if position.nil?
        print ' |'
      else
        print "#{position}|"
      end

      if ((index + 1) % 3).zero? && index + 1 != board.length
        puts "\n-------"
        print '|'
      elsif index + 1 == board.length
        puts "\n-------"
      end
    end
  end
end
# *****************************************************************************
