require_relative '../lib/display'
require_relative '../lib/player'
require_relative '../lib/game'

describe Display do

    context "welcome message " do
        it "displays a welcome message to users" do
            display = Display.new

            display.welcome_message

            expect{ display.welcome_message }.to output("Welcome to Tic Tac Toe\n\n").to_stdout
        end
    end

    context "displays game board" do
        it "displays a blank board to users" do
            display = Display.new
            grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            expected_grid = " 1 | 2 | 3 \n------------\n 4 | 5 | 6 \n------------\n 7 | 8 | 9 \n\n"
            
            expect { display.display_board(grid) }.to output(expected_grid).to_stdout
        end
    end

    context "user prompt " do
        it "displays a prompt for user to choose a place to mark on board" do
            display = Display.new

            display.request_index

            expect { display.request_index }.to output("Please choose a number between 1 - 9: ").to_stdout
        end
    end

    context "error handling" do
        it "displays an error message when user enters incorrect index" do
            display = Display.new

            expect { display.error_message }.to output("Input error. Try again.\n").to_stdout
        end
    end

    context "when X wins the game" do
        it "displays a win message" do
            display = Display.new
            player_two = Player.new("X")

            expect { display.game_result_message(player_two) }.to output("X wins!\n\n").to_stdout
        end
    end

    context "when O wins the game" do
        it "displays a win message" do
            display = Display.new
            player_one = Player.new("O")

            expect { display.game_result_message(player_one) }.to output("O wins!\n\n").to_stdout
        end
    end

    context "When user quits" do
        it "displays a game over message" do
            display = Display.new

            expect { display.game_over }.to output("Thanks for playing, see you next time!").to_stdout
        end
    end

    context "when the game is a draw" do
        it "displays a draw message" do
            display = Display.new

            expect { display.draw_message }.to output("Game has ended as a draw.\n\n").to_stdout
        end
    end
       
    context "when game has ended" do
        it "displays a play again message" do
            display = Display.new

            expect { display.play_again }.to output("Would you like to play again? (Y \/ N): ").to_stdout
        end
    end

    context "when game has ended" do
        it "displays a new game message" do
            display = Display.new

            expect { display.new_game}.to output("New game\n\n").to_stdout
        end
    end
end