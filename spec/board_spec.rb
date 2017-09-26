require 'board'

describe Board

  describe "the tic tac toe board" do

    # It uses an array to facilitate the board
    it "initializes the game board as an array" do
      game = Board.new
      expect(game.board).to be_instance_of(Array)
    end

    # Game uses numbers to identify where the player will place their character
    it "returns an array of numbers including 1 - 9" do
      board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      game = Board.new
      game.board
      expect(game.board).to eq(board)
    end

    # Game uses print_board to print the game
    it "prints the board" do
      game = Board.new
      expect(puts " 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9 ").to match(game.print_board)
    end

    it "prints the game to stdout" do
      game = Board.new
      expect { game.print_board }.to output.to_stdout
    end

    it "replaces the original cell value with an X at index 0" do
      game = Board.new
      game.make_move(0, 'X')
      board = ['X', 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game.board).to eq(board)
    end

    it "replace the original cell value with an O at index 0" do
      game = Board.new
      game.make_move(0, 'O')
      board = ['O', 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game.board).to eq(board)
    end

    it "replaces the orignal cell value with an X at index 5" do
      game = Board.new
      game.make_move(5, 'X')
      board = [1, 2, 3, 4, 5, 'X', 7, 8, 9]
      expect(game.board).to eq(board)
    end

    it "relace the original cell value with an O at index 5" do
      game = Board.new
      game.make_move(5, 'O')
      board = [1, 2, 3, 4, 5, 'O', 7, 8, 9]
      expect(game.board).to eq(board)
    end

    it "gets the index and returns the value" do
      game = Board.new
      expect(game.get_index(0)).to eq(1)
      expect(game.get_index(1)).to eq(2)
    end

    it "checks the diagonals for winning sets" do
      game = Board.new
      game.make_move(0, 'X')
      game.make_move(4, 'X')
      game.make_move(8, 'X')
      winning_diagonal = [game.get_index(0), game.get_index(4), game.get_index(8)]
      player_diagonal = game.board.select { |pos| pos == 'X' }
      expect(winning_diagonal).to eq(player_diagonal)
    end

    it "maintains a reference to the winning diagonals" do
      game = Board.new
      board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game.diagonals).to eq([
                                      [board[0], board[4], board[8]],
                                      [board[2], board[4], board[6]]
                                    ])
    end

    it "maintains a reference to the winning horizontals" do
      game = Board.new
      board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game.horizontals).to eq([
                                      [board[0], board[1], board[2]],
                                      [board[3], board[4], board[5]],
                                      [board[6], board[7], board[8]]
                                    ])
    end

    it "maintains a reference to the winning verticals" do
      game = Board.new
      board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game.verticals).to eq([
                                      [board[0], board[3], board[6]],
                                      [board[1], board[4], board[7]],
                                      [board[2], board[5], board[8]]
                                    ])
    end
  end
