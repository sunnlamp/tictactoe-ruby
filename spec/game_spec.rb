require 'game'

describe Game

  describe "the tic tac toe board" do

    # Game uses an array to facilitate the board
    it "initializes the game board" do
      game = Game.new
      game.board
      expect(game.board).to be_instance_of(Array)
    end

    # Game uses numbers to identify where the player will place their character
    it "returns an array of numbers" do
      board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      game = Game.new
      game.board
      expect(game.board).to eq(board)
    end

    # Game uses print_board to print the game board after every move
    it "prints the board" do
      game = Game.new
      expect(puts " 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9 ").to match(game.print_board(game.board))
    end

    it "prints the game to stdout" do
      game = Game.new
      expect { game.print_board(game.board) }.to output.to_stdout
    end
  end
