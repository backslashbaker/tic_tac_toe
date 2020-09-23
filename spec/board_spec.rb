require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
    
    context "new game" do
        it "initialises an empty board" do
            board = Board.new

            expect(board.grid).to eq Array.new(3, Array.new(3, " "))
            
        end

    end

    context "starting game" do
        it "changes element of board array" do
            board = Board.new
            board.update_grid(0, 0, 'O')

            expect(board.grid[0][0]).to eq('O')
        end

        it "changes element of board array for next player" do
            board = Board.new
            board.update_grid(0, 1, 'X')

            expect(board.grid[0][1]).to eq('X')
        end

    end

end