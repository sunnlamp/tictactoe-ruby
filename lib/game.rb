class Game
  attr_reader :players, :board, :current_player, :other_player

  def initialize(players, board = Board.new)
    @board = board
    @current_player, @other_player = players.shuffle
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def play

    while !board.winner? || board.draw?
      puts "****************************************"
      puts "Player 1, enter your name: "

    end
  end

end
