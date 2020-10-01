require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game'

describe "Tic-Tac-Toe" do

    context "when beginning a new game" do
        xit "displays an empty board to the user" do
            game = Game.new

            expect { game.display.display_board(game.board.grid) }.to output(" 1 | 2 | 3 \n------------\n 4 | 5 | 6 \n------------\n 7 | 8 | 9 \n").to_stdout
        end
    end

    context "when beginning a game" do
        it "can play until a win" do
            # Arrange
            game = Game.new

            # Act
            allow($stdin).to receive(:gets).and_return(1, 5, 2, 8, 3)
            game.play

            # Assert
            expect(game.board.grid).to eq(["O", "O", "O", 4, "X", 6, 7, "X", 9])
        end
    end

end