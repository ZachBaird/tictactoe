# frozen_string_literal: true

# *****************************************************************************
# RefereeManager - Determines whether the game should end based on if there's
#   a winner or if turns have run out
class RefereeManager
  def self.check_game?(array, num_of_turns)
    if num_of_turns == array.length
      false
    elsif test_for_winning_combo?(array)
      yield(true)
      false
    else
      true
    end
  end

  # Class method taking in board array and testing winning positions
  #   Returns true if there's a winner
  #   Returns false if there isn't a winner
  def self.test_for_winning_combo?(array)
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
