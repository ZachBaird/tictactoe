# frozen_string_literal: true

# An object representing a move in tic tac toe
class Move
  attr_reader :player, :pos

  def initialize(player, position)
    @player = player
    @pos = position
  end
end
