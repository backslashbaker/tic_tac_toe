require_relative '../lib/board'

describe Board do
    
    context "new game" do
        it "initialises an empty board" do
            board = Board.new

            expect(board.grid).to eq Array.new(3, Array.new(3, " "))

            #expect(board.display).to eq(" #{@grid[0[0]]} | #{@grid[0[1]]} | #{@grid[0[2]]}\n
                                       # ------------\n
                                        #{@grid[1[0]]} | #{@grid[1[1]]} | #{@grid[1[2]]}\n
                                        #------------\n
                                        #{@grid[2[0]]} | #{@grid[2[1]]} | #{@grid[2[2]]}")
        end

    end

end