require_relative '../lib/display'
#require_relative '../lib/board'

describe Display do

    let(:output) { StringIO.new }
    let(:input) { StringIO.new }

    context "welcome message " do
        it "displays a welcome message to users" do
            display = Display.new(input, output)

            display.welcome_message

            expect(output.string).to eq("Welcome to Tic Tac Toe\n")
        end
    end

    context "displays game board" do
        it "displays a blank board to users" do
            display = Display.new(input, output)

            grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]

            display.display_board(grid)

            expect(output.string).to eq(" 1 | 2 | 3 \n------------\n 4 | 5 | 6 \n------------\n 7 | 8 | 9 ")
        
        end
    end
       

end