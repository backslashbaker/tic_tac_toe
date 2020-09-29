require_relative '../lib/display'
require_relative '../lib/board'

describe Display do

    let(:output) { StringIO.new }
    let(:input) { StringIO.new }

    context "welcome message " do
        it "displays a welcome message to users" do
            display = Display.new(input, output)

            display.welcome

            expect(output.string).to eq("Welcome to Tic Tac Toe\n")
        end
    end

end