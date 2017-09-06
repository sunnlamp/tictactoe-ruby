require 'game'

describe Game

  describe "the tic tac toe board" do
    
    it "initializes the game board" do
      board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      game = Game.new
      game.board
      expect(game.board).to eq(board)
    end
  end
