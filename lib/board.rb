class Board
  attr_reader :squares

  # initializes an instance of the board
  def initialize
    @squares = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end

  def display_square(row, column)
    (row * 3) + column + 1
  end

  # used to print the board
  def board_string
    [
      "#{display_square(0, 0)} | #{display_square(0, 1)} | #{display_square(0, 2)} ",
      "#{display_square(1, 0)} | #{display_square(1, 1)} | #{display_square(1, 2)} ",
      "#{display_square(2, 0)} | #{display_square(2, 1)} | #{display_square(2, 2)} "
    ].join("\n")
  end

  def print_board
    puts board_string
  end

  # changes the value of the array index to the players mark
  def make_move(position, player)
    row, col = get_index(position: position)
    if @squares[row][col].nil?
      @squares[row][col] = player
    else
      raise ArgumentError.new('Position already taken!')
    end
  end

  # returns the value at the index provided
  def get_index(position:)
    row = (position - 1) / 3
    col = (position - 1) % 3
    return row, col
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

  def all_same?
    self.all? { |element| element == self[0] }
  end
end
