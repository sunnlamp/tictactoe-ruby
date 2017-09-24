require 'board'

describe Board

  describe "the tic tac toe board" do

    # It uses an array to facilitate the board
    it "initializes the game board" do
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
      game.make_x_move(0)
      board = ['X', 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game.board).to eq(board)
    end

    it "replace the original cell value with an O at index 0" do
      game = Board.new
      game.make_o_move(0)
      board = ['O', 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game.board).to eq(board)
    end

    it "replaces the orignal cell value with an X at index 5" do
      game = Board.new
      game.make_x_move(5)
      board = [1, 2, 3, 4, 5, 'X', 7, 8, 9]
      expect(game.board).to eq(board)
    end

    it "relace the original cell value with an O at index 5" do
      game = Board.new
      game.make_o_move(5)
      board = [1, 2, 3, 4, 5, 'O', 7, 8, 9]
      expect(game.board).to eq(board)
    end

  end
