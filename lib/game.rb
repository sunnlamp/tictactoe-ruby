class Game
  attr_reader :players, :board, :current_player, :other_player

  def initialize(players, board)
    @players = players
    @board = board
    @current_player, @other_player = players.shuffle
  end
end
