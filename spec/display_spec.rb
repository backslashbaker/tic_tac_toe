require_relative '../lib/display'
require_relative '../lib/player'

describe Display do

    let(:output) { StringIO.new }
    let(:input) { StringIO.new }

    context "welcome message " do
        it "displays a welcome message to users" do
            display = Display.new(input, output)

            display.welcome_message

            expect(output.string).to eq("Welcome to Tic Tac Toe\n\n")
        end
    end

    context "displays game board" do
        it "displays a blank board to users" do
            display = Display.new(input, output)

            grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]

            display.display_board(grid)

            expect(output.string).to eq(" 1 | 2 | 3 \n------------\n 4 | 5 | 6 \n------------\n 7 | 8 | 9 \n\n")
        
        end
    end

    context "gets user input" do
        it "asks user to choose a coordinate" do
            display = Display.new(input, output)

            display.get_input

            expect(input).to receive(:gets).and_return('5')

            display.get_input
        end
    end

    context "user prompt " do
        it "displays a prompt for user to choose a place to mark on board" do
            display = Display.new(input, output)

            display.request_index

            expect(output.string).to eq("Please choose a number between 1 - 9: ")
        end
    end

    context "error handling" do
        it "displays an error message when user enters incorrect index" do
            display = Display.new(input, output)

            display.error_message

            expect(output.string).to eq("Input error. Try again.\n")
        end
    end

    context "when O wins the game" do
        xit "displays a win message" do
            game = Game.new

            allow($stdin).to receive(:gets).and_return(1, 4, 5, 2, 9)
            game.play
            game.display.game_result_message(game.game_logic.game_result(game.board, game.previous_player))

            expect(output.string).to eq("O wins!")
        end
    end

    # context "when X wins the game" do
    #     it "displays a win message" do
    #         display = Display.new(input, output)
    #         player_two = Player.new("X")

    #         display.player_wins_message(player_two)

    #         expect(output.string).to eq("X wins!")
    #     end
    # end

    context "when O wins the game" do
        xit "displays a win message" do
            display = Display.new(input, output)
            player_one = Player.new("O")

            display.player_wins_message(player_one)

            expect(output.string).to eq("O wins!")
        end
    end
       
end