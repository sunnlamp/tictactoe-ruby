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
    if @squares[row][column].nil?
      return (row * 3) + column + 1
    end
    return @squares[row][column]
  end

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
      [squares[0][0], squares[1][1], squares[2][2]],
      [squares[0][2], squares[1][1], squares[2][0]]
    ]
  end

  def horizontals
    [
      [squares[0][0], squares[0][1], squares[0][2]],
      [squares[1][0], squares[1][1], squares[1][2]],
      [squares[2][0], squares[2][1], squares[2][2]]
    ]
  end

  def verticals
    [
      [squares[0][0], squares[1][0], squares[2][0]],
      [squares[0][1], squares[1][1], squares[2][1]],
      [squares[0][2], squares[1][2], squares[2][2]]
    ]
  end

  def winning_positions
    diagonals + horizontals + verticals
  end

  def check_winning_set(position)
    position.map { |index| index }
  end

  def winner?
    winning_positions.each do |position|
      next if check_winning_set(position).any? { |a| a == nil }
      return true if check_winning_set(position).all? { |a| a == a[0]  }
    end
    false
  end

  def draw?
    if squares.map { |a| a }.nil?
      return false
    end
    true
  end
end
