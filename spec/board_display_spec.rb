require 'board_display'

describe BoardDisplay do
    describe '#print_board' do
      it 'prints the game to stdout' do
        display = BoardDisplay.new

        expect{ display.print_board }.to output.to_stdout
      end
    end

    describe '#board_string' do
      it 'maintains a reference to the board state' do
        display = BoardDisplay.new
        board = " 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9 "

        expect(display.board_string).to match(board)
      end
    end
end
