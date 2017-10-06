require 'game'

describe Game do
  context '#initialize' do
    it 'initializes the game with a board, a player, an AI, and starter' do
      board = Board.new
      player1 = Player.new('Name')
      player2 = Player.new('AI')
      players = player1, player2
      game = Game.new(players, board)

      expect(players).to be_instance_of(Array)
      expect(game.board).to be_instance_of(Board)
    end
  end
end
