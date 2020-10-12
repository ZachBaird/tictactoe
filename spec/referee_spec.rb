# frozen_string_literal: true

require './lib/referee'
require './lib/move'
require 'pry'

describe Referee do
  context 'returns true for correct winners' do
    it 'indicates x is winner with top row filled' do
      referee = Referee.new

      move = Move.new('x', 0)
      referee.play move

      move = Move.new('x', 1)
      referee.play move

      move = Move.new('x', 2)
      referee.play move

      expect(referee.winner?).to be true
      expect(referee.winner).to eql 'x'
    end

    it 'indicates o is winner with left row filled' do
      referee = Referee.new

      move = Move.new('o', 0)
      referee.play move

      move = Move.new('o', 3)
      referee.play move

      move = Move.new('o', 6)
      referee.play move

      expect(referee.winner?).to be true
      expect(referee.winner).to eql 'o'
    end
  end

  context 'returns false when no winner is present' do
    it 'returns false when no moves have been played' do
      referee = Referee.new

      expect(referee.winner?).not_to be true
    end

    it 'returns false when no winning combination is present' do
      referee = Referee.new

      move = Move.new('x', 1)
      referee.play move

      move = Move.new('x', 8)
      referee.play move

      expect(referee.winner?).not_to be true
    end

    it 'returns false when one move has been played' do
      referee = Referee.new

      move = Move.new('x', 0)
      referee.play move

      expect(referee.winner?).not_to be true
    end
  end
end
