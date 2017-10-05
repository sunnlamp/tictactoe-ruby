require 'board'

describe Board do
  context '#initialize' do
    it 'initializes the game board as a 2D array' do
      game = Board.new
      expect(game.squares).to eq(
      [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil],
      ]
      )
    end
  end

  describe '#board_string' do
    context 'when the board is empty' do
      it 'prints the board sauare numbers' do
        game = Board.new
        expect(game.board_string).to match(" 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9 ")
      end
    end

    context "when the board has squares filled" do
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
    it "returns the row and column given a position number" do
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
        [nil, nil, nil],
      ]

      expect(game.squares).to eq(board)
    end

    context "when square is already occupied" do
      it "raises exception" do
        game = Board.new
        game.make_move(1, 'X')

        expect { game.make_move(1, 'X') }.to raise_exception("Position already taken!")
      end
    end

    it 'replace the original cell value with an O at index 0' do
      game = Board.new
      game.make_move(0, 'O')
      board = ['O', 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game.board).to eq(board)
    end

    it 'replaces the orignal cell value with an X at index 5' do
      game = Board.new
      game.make_move(5, 'X')
      board = [1, 2, 3, 4, 5, 'X', 7, 8, 9]
      expect(game.board).to eq(board)
    end

    it 'relace the original cell value with an O at index 5' do
      game = Board.new
      game.make_move(5, 'O')
      board = [1, 2, 3, 4, 5, 'O', 7, 8, 9]
      expect(game.board).to eq(board)
    end
  end

  context '#get_index' do
    it 'gets the index and returns the value' do
      game = Board.new
      expect(game.get_index(0)).to eq(1)
      expect(game.get_index(1)).to eq(2)
    end
  end

  context '#diagonals' do
    # this test needs to be rewritten
    it 'checks the diagonals for winning sets' do
      game = Board.new
      game.make_move(0, 'X')
      game.make_move(4, 'X')
      game.make_move(8, 'X')
      diagonal = [game.get_index(0), game.get_index(4), game.get_index(8)]
      winning_diagonal = diagonal
      player_diagonal = game.board.select { |pos| pos == 'X' }
      expect(winning_diagonal).to eq(player_diagonal)
    end

    it 'maintains a reference to the winning diagonals' do
      game = Board.new
      board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game.diagonals).to eq([
        [board[0], board[4], board[8]],
        [board[2], board[4], board[6]]
        ])
      end
    end

    context '#horizontals' do
      it 'maintains a reference to the winning horizontals' do
        game = Board.new
        board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        expect(game.horizontals).to eq([
          [board[0], board[1], board[2]],
          [board[3], board[4], board[5]],
          [board[6], board[7], board[8]]
          ])
        end
      end

    context '#winning_positions' do
      it 'collects all winning combinations' do
        game = Board.new
        board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        expect(game.winning_positions).to eq([
          [board[0], board[4], board[8]],
          [board[2], board[4], board[6]],
          [board[0], board[1], board[2]],
          [board[3], board[4], board[5]],
          [board[6], board[7], board[8]],
          [board[0], board[3], board[6]],
          [board[1], board[4], board[7]],
          [board[2], board[5], board[8]]
          ])
        end
      end
    end
