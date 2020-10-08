# frozen_string_literal: true

require './lib/board'

describe Board do
  context 'board printing with valid data' do
    it 'prints an empty board when initialized' do
      board = Board.new

      expect(board.current_board)
        .to eq " | |\n-----\n | |\n-----\n | |"
    end

    it 'prints a board with the top row filled when top row is filled with x' do
      board = Board.new
      test_data = ['x', 'x', 'x', nil, nil, nil, nil, nil, nil]

      board.update_board test_data

      expect(board.current_board)
        .to eq "x|x|x\n-----\n | |\n-----\n | |"
    end

    it 'prints a board with right row filled' do
      board = Board.new
      test_data = [nil, nil, 'x', nil, nil, 'x', nil, nil, 'x']

      board.update_board test_data

      expect(board.current_board)
        .to eq " | |x\n-----\n | |x\n-----\n | |x"
    end

    it 'expects a mismatch of values to be printed in appropriate positions' do
      board = Board.new
      test_data = ['x', 'y', 'x', 'y', nil, 'y', nil, 'x', nil]

      board.update_board test_data

      expect(board.current_board)
        .to eq "x|y|x\n-----\ny| |y\n-----\n |x|"
    end

    it 'expects a board to be fully printed if all data is present' do
      board = Board.new
      test_data = ['x', 'x', 'x', 'y', 'y', 'y', 'x', 'y', 'x']

      board.update_board test_data

      expect(board.current_board)
        .to eq "x|x|x\n-----\ny|y|y\n-----\nx|y|x"
    end
  end

  context 'handling invalid board states' do
    it 'returns an empty board after initialization and jumbled update' do
      board = Board.new
      test_data = [1, 5, 2, 7, 2.5, true, false]

      board.update_board test_data

      expect(board.current_board)
        .to eq " | |\n-----\n | |\n-----\n | |"
    end

    it 'returns an empty board after initialization and nil update' do
      board = Board.new

      board.update_board nil

      expect(board.current_board)
        .to eq " | |\n-----\n | |\n-----\n | |"
    end

    it 'retains current board state after nil update' do
      board = Board.new
      test_data = ['x', 'y', 'x', 'y', nil, 'y', nil, 'x', nil]

      board.update_board test_data
      board.update_board nil

      expect(board.current_board)
        .to eq "x|y|x\n-----\ny| |y\n-----\n |x|"
    end
  end
end
