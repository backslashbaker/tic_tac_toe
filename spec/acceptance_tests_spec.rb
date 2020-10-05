require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game'

describe "Tic-Tac-Toe" do

    #let(:output) { StringIO.new }
    #let(:input) { StringIO.new }

    context "when beginning a new game" do
        xit "displays an empty board to the user" do
            # Arrange
            game = Game.new
            grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            expected_grid = " 1 | 2 | 3 \n------------\n 4 | 5 | 6 \n------------\n 7 | 8 | 9 \n\n"

            # Act
            # game.play
            # game.display.display_board(game.board.grid)

            # Assert
            expect { game.display.display_board(grid) }.to output(expected_grid).to_stdout
            #expect { game.display.display_board(game.board.grid) }.to output(expected_grid).to_stdout
        end
    end

    context "when beginning a game" do
        xit "can play until a win" do
            # Arrange
            game = Game.new

            # Act
            allow($stdin).to receive(:gets).and_return(1, 5, 2, 8, 3)
            game.play

            # Assert
            expect(game.board.grid).to eq(["O", "O", "O", 4, "X", 6, 7, "X", 9])
            expect { game.display.display_board(game.board.grid) }.to output(" O | O | O \n------------\n 4 | X | 6 \n------------\n 7 | X | 9 \n\n").to_stdout
        end
    end

end

=begin
- when the user types q or quit, they see "game over"
- when the user makes a move, it is displayed on the board
- when the user makes an incorrect move, an error message is displayed
- when the user makes an illegal move, an error message is displayed
- when a player wins, a win message is displayed
- when we have a draw, a draw message is displayed
=end