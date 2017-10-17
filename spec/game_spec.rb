require 'game'

describe Game do

  let(:hal) { Player.new('Hal', 'X') }
  let(:al) { Player.new('Al', 'O') }

  context '#initialize' do
    it 'initializes the game with a board, and players' do
      player1 = Player.new('Hal')
      player2 = Player.new('Al')
      players = player1, player2
      game = Game.new(players)

      expect(players).to be_instance_of(Array)
      expect(players).to include(player1, player2)
      expect(game.board).to be_instance_of(Board)
    end
  end

  context '#switch_players' do
    it 'should switch players between turns' do
      game = Game.new([:hal, :al], Board.new)
      current_player = :hal
      other_player = :al
      game.switch_players

      expect(current_player).to eq(:hal)
    end
  end

  context '#play' do
    it 'runs a loop until there is a winner' do
      game = Game.new([:hal, :al])
      game.board.make_move(1, 'X')
      game.board.make_move(4, 'X')
      game.board.make_move(7, 'X')

      expect(game.board.winner?).to eq(true)
    end

    it 'requests the name of player 1' do

    end

    it 'requests the name of player 2' do

    end



    it 'runs a loop until there is a draw' do
      game = Game.new([:hal, :al])
      game.board.make_move(1, 'X')
      game.board.make_move(2, 'O')
      game.board.make_move(3, 'X')
      game.board.make_move(4, 'O')
      game.board.make_move(5, 'X')
      game.board.make_move(6, 'O')
      game.board.make_move(7, 'X')
      game.board.make_move(8, 'O')
      game.board.make_move(9, 'X')

      expect(game.board.draw?).to eq(true)
    end
  end
end
