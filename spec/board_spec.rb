require 'board'

describe Board

  describe "the tic tac toe board" do

    # Game uses an array to facilitate the board
    it "initializes the game board" do
      game = Board.new
      game.board
      expect(game.board).to be_instance_of(Array)
    end

    # Game uses numbers to identify where the player will place their character
    it "returns an array of numbers" do
      board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      game = Board.new
      game.board
      expect(game.board).to eq(board)
    end

    # Game uses print_board to print the game board after every move
    it "prints the board" do
      game = Board.new
      expect(puts " 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9 ").to match(game.print_board(game.board))
    end

    it "prints the game to stdout" do
      game = Board.new
      expect { game.print_board(game.board) }.to output.to_stdout
    end
  end
