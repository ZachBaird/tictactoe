# frozen_string_literal: true

require_relative 'move'
require 'pry'

# Stores played moves and determines a winner
class Referee
  attr_reader :played_moves

  def initialize
    @played_moves = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def play(move)
    @played_moves[move.pos] = move
  end

  def winner?
    game_results = determine_if_victory

    return false if game_results.nil? || game_results[:has_winner].nil?

    game_results[:has_winner]
  end

  def winner
    game_results = determine_if_victory

    return 'No winner' unless game_results[:has_winner]

    game_results[:winner]
  end

  private

  def determine_if_victory
    winning_spots = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                     [0, 3, 6], [1, 4, 7], [2, 5, 8],
                     [0, 4, 8], [2, 4, 6]]

    result = {}
    result[:has_winner] = false

    winning_spots.each do |combo|
      actual = [@played_moves[combo[0]], @played_moves[combo[1]],
                @played_moves[combo[2]]]

      if !actual.any?(&:nil?) && 
        ((actual[0].player == actual[1].player) && (actual[1].player == actual[2].player))
        result[:has_winner] = true
        result[:winner] = actual[0].player
        return result
      end
    end

    result
  end

  
end
