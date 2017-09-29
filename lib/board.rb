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

  # this returns the value at the index provided
  def get_index(position)
    @board[position]
  end

  def diagonals
    [
      [board[0], board[4], board[8]],
      [board[2], board[4], board[6]]
    ]
  end

  def horizontals
    [
      [board[0], board[1], board[2]],
      [board[3], board[4], board[5]],
      [board[6], board[7], board[8]]
    ]
  end

  def verticals
    [
      [board[0], board[3], board[6]],
      [board[1], board[4], board[7]],
      [board[2], board[5], board[8]]
    ]
  end

  def winning_positions
    diagonals + horizontals + verticals
  end

  # def check_winning_set(position)
  #   position.map { |index| index }
  # end
  #
  # def winner?
  #   winning_positions.each do |position|
  #     return true if check_winning_set(position)
  #   end
  #   false
  # end
end
