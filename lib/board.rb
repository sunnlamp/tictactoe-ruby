class Board
  attr_reader :board

  # initializes an instance of the board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # used to print the board
  def print_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # changes the value of the array index to the players mark
  def make_move(position, player)
    @board.delete_at(position)
    @board.insert(position, player)
  end

  # used to check the two diagonal winning moves
  def check_diagonals(player)
    if get_index(0) == player && @board[4] == player && @board[8] == player
      return :winner
    elsif @board[2] == player && @board[4] == player && @board[6] == player
      retunr :winner
    end
  end

  # this returns the value at the index provided
  def get_index(position)
    @board[position]
  end
end
