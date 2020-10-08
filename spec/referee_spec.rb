# frozen_string_literal: true

require './lib/referee.rb'

describe Referee do
  context 'returns true for correct winners' do
    it 'indicates x is winner with top row filled' do
      referee = Referee.new
      Move = Struct.new(:player, :pos)

      move = Move.new

      move.player = 'x'
      move.pos = 0
      referee.play move

      move.pos = 1
      referee.play move

      move.pos = 2
      referee.play 0

      expect(referee.has_winner?).to be true
      expect(referee.winner).to eql 'x'
    end
  end
end
