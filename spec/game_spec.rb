require 'game'

describe Game do
  context '#initialize' do
    it 'initializes the game with a board, a player, an AI, and starter' do
      board = Board.new
      player1 = Player.new('Foo', 'X')
      player2 = Player.new('Al', 'O')
      players = player1, player2
      game = Game.new(players, board)

      expect(players).to be_instance_of(Array)
      expect(game.board).to be_instance_of(Board)
    end
  end

  context '#switch_players' do
    let(:foo) { Player.new('Foo', 'X') }
    let(:al) { Player.new('Al', 'O') }
    it 'should switch players between turns' do
      game = Game.new([:foo, :al], Board.new)
      game.switch_players
      expect(game.current_player).to eq(:foo || :al)
    end
  end
end
