require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
    
    context "new game" do
        it "initialises an empty board" do
            board = Board.new

            expect(board.grid).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
        end
    end

    context "starting game" do
        it "changes element of board array" do
            board = Board.new
            board.update_grid(0, 'O')

            expect(board.grid[0]).to eq('O')
        end

        it "changes element of board array for next player" do
            board = Board.new
            board.update_grid(1, 'X')

            expect(board.grid[1]).to eq('X')
        end
    end

    

    context "checking if board is full" do
        it "returns true if board is full" do
            board = Board.new
            board.update_grid(0, "O")
            board.update_grid(1, "O")
            board.update_grid(2, "O")
            board.update_grid(3, "O")
            board.update_grid(4, "O")
            board.update_grid(5, "O")
            board.update_grid(6, "O")
            board.update_grid(7, "O")
            board.update_grid(8, "O")

            expect(board.full?).to eq(true)
        end

        it "returns false if board is not full" do
            board = Board.new
            board.update_grid(8, "O")

            expect(board.full?).to eq(false)
        end
    end

    

end