require_relative '../lib/board'

describe Board do
    
    context "new game" do
        it "initialises an empty board" do
            board = Board.new

            expect(board.display).to eq("   |   |   \n------------\n   |   |   \n------------\n   |   |   ")
        end

    end

end

# Given: a new game has started

# When: a new game starts

# Then: an empty board is initialised


