require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
    
    context "new game" do
        it "initialises an empty board" do
            board = Board.new

            expect(board.grid).to eq Array.new(9, " ")
            
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

    context "move validation" do
        it "validates player moves when something is in that square" do
            board = Board.new
            board.update_grid(0, "O")

            expect(board.valid_move?(0)).to eq(false)
        end

        it "validates player moves when something is not in that square" do
            board = Board.new
            board.update_grid(0, "O")

            expect(board.valid_move?(1)).to eq(true)
        end
    end

    context "Within a game" do
        xit "knows a winning board" do
            board = Board.new
            board.update_grid(0, 1, 'X')
            board.update_grid(0, 2, 'X')
            board.update_grid(0, 3, 'X')

            expect(board.winning_combination?).to eq true
            
        end

    end

end