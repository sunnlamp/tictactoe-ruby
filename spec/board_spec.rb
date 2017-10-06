require 'board'

describe Board do
  describe '#initialize' do
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

  # describe '#board_string' do
  #   context 'when the board is empty' do
  #     it 'prints the board sauare numbers' do
  #       game = Board.new
  #       board = " 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9 "
  #
  #       expect(game.board_string).to match(board)
  #     end
  #   end
  #
  #   context 'when the board has squares filled' do
  #     it 'prints the board square number where empty, and markers where occupied' do
  #       game = Board.new
  #       player1 = 'X'
  #       player2 = 'O'
  #       game.make_move(3, player1)
  #       game.make_move(7, player2)
  #       board = " 1 | 2 | #{player1} \n 4 | 5 | 6 \n #{player2} | 8 | 9 "
  #
  #       expect(game.board_string).to match(board)
  #     end
  #   end
  # end

  # describe '#print_board' do
  #   it 'prints the game to stdout' do
  #     game = Board.new
  #
  #     expect { game.print_board }.to output.to_stdout
  #   end
  # end

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

        expect{ game.make_move(1, 'X') }.to raise_exception('Position already taken!')
      end
    end
  end

  describe '#winning_positions' do
    it 'keeps an array of the winning positions' do
      game = Board.new
      squares = [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
      ]
      winning_positions =
      [squares[0][0], squares[1][1], squares[2][2]],
      [squares[0][2], squares[1][1], squares[2][0]],
      [squares[0][0], squares[0][1], squares[0][2]],
      [squares[1][0], squares[1][1], squares[1][2]],
      [squares[2][0], squares[2][1], squares[2][2]],
      [squares[0][0], squares[1][0], squares[2][0]],
      [squares[0][1], squares[1][1], squares[2][1]],
      [squares[0][2], squares[1][2], squares[2][2]]

      expect(game.winning_positions).to eq(winning_positions)
    end
  end

  describe '#winner?' do
    it 'checks for a winning set' do
      board = Board.new
      player = 'X'
      board.make_move(1, player)
      board.make_move(5, player)
      board.make_move(9, player)

      expect(board.winner?).to eq(true)
    end
  end

  describe '#draw?' do
    it 'checks for a draw game' do
      board = Board.new
      player1 = 'X'
      player2 = 'O'
      board.make_move(1, player1)
      board.make_move(4, player2)
      board.make_move(2, player1)
      board.make_move(3, player2)
      board.make_move(6, player1)
      board.make_move(5, player2)
      board.make_move(7, player1)
      board.make_move(8, player2)
      board.make_move(9, player1)

      expect(board.draw?).to eq(true)
    end
  end
end
