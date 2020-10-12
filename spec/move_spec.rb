# frozen_string_literal: true

require './lib/move'

describe Move do
  context '#initialize' do
    it 'initializes properly with player and pos data' do
      move = Move.new('x', 0)

      expect(move.player).to eql 'x'
      expect(move.pos).to eql 0
    end
  end
end
