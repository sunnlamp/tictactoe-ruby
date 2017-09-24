class Board
  attr_reader :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def make_move(position, player)
    @board.delete_at(position)
    @board.insert(position, player)
  end

  def check_diagonals(position, player)
    @board.select { |a| a == player}
  end
end
