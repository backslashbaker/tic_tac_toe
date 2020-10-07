require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/game_logic'

describe "Tic-Tac-Toe" do


    context "when beginning a new game" do
        it "displays an empty board to the user" do
            # Arrange
            game = Game.new
            grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            expected_grid = " 1 | 2 | 3 \n------------\n 4 | 5 | 6 \n------------\n 7 | 8 | 9 \n\n"

            # Assert
            expect { game.display.display_board(grid) }.to output(expected_grid).to_stdout
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

    context "when the user types 'quit'" do
        it "displays a 'game over' message" do
            # Arrange
            game = Game.new

            # Act
            allow($stdin).to receive(:gets).and_return("quit")
            game.play

            # Assert
            expect { game.take_turn }.to output(/#{Regexp.quote("Thanks for playing, see you next time!")}/).to_stdout
        end
    end

    context "when the user types 'q'" do
        it "displays a 'game over' message" do
            # Arrange
            game = Game.new

            # Act
            allow($stdin).to receive(:gets).and_return("q")
            game.play

            # Assert
            expect { game.take_turn }.to output(/#{Regexp.quote("Thanks for playing, see you next time!")}/).to_stdout
        end
    end

    context "when the user makes a move" do
        it "it is displayed on the board" do
            #Arrange
            game = Game.new

            #Act
            allow($stdin).to receive(:gets).and_return("1")
            game.take_turn

            #Assert
            expect(game.board.grid).to eq(["O", 2, 3, 4, 5, 6, 7, 8, 9])
        end
    end

    context "when the user makes an incorrect move" do
        it "displays an error message" do
            # Arrange
            game = Game.new

            # Act
            allow($stdin).to receive(:gets).and_return("blah")
            game.take_turn

            # Assert
            expect { game.take_turn }.to output(/#{Regexp.quote("Input error. Try again.\n")}/).to_stdout
        end
    end


    context "when the user makes an incorrect move" do
        it "displays an error message" do
            # Arrange
            game = Game.new

            # Act
            allow($stdin).to receive(:gets).and_return("1", "1")
            game.take_turn

            # Assert
            expect { game.take_turn }.to output(/#{Regexp.quote("Input error. Try again.\n")}/).to_stdout
        end
    end

    context "when a player wins" do
        it "displays a win message" do
            # Arrange
            game = Game.new

            # Act 
            allow($stdin).to receive(:gets).and_return(1, 5, 2, 8, 3)
            game.play

            # Assert
            expect { game.play }.to output(/#{Regexp.quote("O wins!")}/).to_stdout
        end
    end

    context "when a player wins" do
        it "displays a win message" do
            # Arrange
            game = Game.new

            # Act 
            allow($stdin).to receive(:gets).and_return(9, 1, 5, 2, 8, 3)
            game.play

            # Assert
            expect { game.play }.to output(/#{Regexp.quote("X wins!")}/).to_stdout
        end
    end

    context "when there is a draw" do
        it "displays a draw message" do
            # Arrange
            game = Game.new

            # Act
            allow($stdin).to receive(:gets).and_return(9, 1, 2, 3, 5, 4, 6, 8, 7)
            game.play

            # Assert
            expect { game.play }.to output(/#{Regexp.quote("Game has ended as a draw.")}/).to_stdout
        end
    end

end

=begin
- when we have a draw, a draw message is displayed
- when the game ends, a play again message is displayed
=end