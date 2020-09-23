require_relative '../lib/board'

describe Board do
    
    context "new game" do
        it "initialises an empty board" do
            board = Board.new

            expect(board.display).to eq("   |   |   \n------------\n   |   |   \n------------\n   |   |   ")
        end

    end

    context "started a game" do
        it "allows the user to mark 'O' on the board" do
            board = Board.new

            expect(board.display).to eq("   |   |   \n------------\n   |   |   \n------------\n   |   |   ")
        end

    end

end