require 'board'

describe Board do
  context '#initialize' do
    it 'initializes the game board as a 2D array' do
      game = Board.new

      expect(game.squares).to eq(
        [
          [nil, nil, nil],
          [nil, nil, nil],
          [nil, nil, nil]
        ]
      )
    end
  end

  describe '#board_string' do
    context 'when the board is empty' do
      it 'prints the board sauare numbers' do
        game = Board.new
        board = " 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9 "

        expect(game.board_string).to match(board)
      end
    end

    context 'when the board has squares filled' do
      it 'prints the board square number where empty, and markers where occupied'
    end
  end

  describe '#print_board' do
    it 'prints the game to stdout' do
      game = Board.new

      expect { game.print_board }.to output.to_stdout
    end
  end

  describe '#get_index' do
    it 'returns the row and column given a position number' do
      board = Board.new

      expect(board.get_index(position: 1)).to eq([0, 0])
      expect(board.get_index(position: 5)).to eq([1, 1])
      expect(board.get_index(position: 9)).to eq([2, 2])
    end
  end

  describe '#make_move' do
    it 'replaces the original cell value with an X at index 0' do
      game = Board.new
      game.make_move(1, 'X')
      board = [
        ['X', nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
      ]

      expect(game.squares).to eq(board)
    end

    context 'when square is already occupied' do
      it 'raises an expection' do
        game = Board.new
        game.make_move(1, 'X')
        exception = 'Position already taken!'

        expect { game.make_move(1, 'X') }.to raise_exception(exception)
      end
    end
  end
end
