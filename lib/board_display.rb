class BoardDisplay
  attr_reader :board_string

  def print_board
    puts board_string
  end

  def display_square(row, column)
    (row * 3) + column + 1
  end

  def board_string
    [
      "#{display_square(0, 0)} | #{display_square(0, 1)} | #{display_square(0, 2)} ",
      "#{display_square(1, 0)} | #{display_square(1, 1)} | #{display_square(1, 2)} ",
      "#{display_square(2, 0)} | #{display_square(2, 1)} | #{display_square(2, 2)} "
    ].join("\n")
  end
end
