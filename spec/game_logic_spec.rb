require_relative '../lib/game_logic'
require_relative '../lib/board'

describe GameLogic do
    context "move validation" do
        it "validates player moves when something is in that square" do
            game_logic = GameLogic.new
            board = Board.new

            board.update_grid(0, "O")
    
            expect(game_logic.valid_move?(board, 0)).to eq(false)
        end
    
        it "validates player moves when something is not in that square" do
            game_logic = GameLogic.new
            board = Board.new

            board.update_grid(0, "O")
    
            expect(game_logic.valid_move?(board, 1)).to eq(true)
        end
    end
    
    context "checking if we have a winning game_logic" do
        it "knows a winning game_logic (first row)" do
            game_logic = GameLogic.new
            board = Board.new

            board.update_grid(0, 'X')
            board.update_grid(1, 'X')
            board.update_grid(2, 'X')
    
            expect(game_logic.win?(board)).to eq(true)
        end
    
        it "knows non winning game_logic" do
            game_logic = GameLogic.new
            board = Board.new

            board.update_grid(0, 'X')
            board.update_grid(1, 'O')
            board.update_grid(2, 'X')
    
            expect(game_logic.win?(board)).to eq(false)
        end
    
        it "knows a winning game_logic (vertical right)" do
            game_logic = GameLogic.new
            board = Board.new

            board.update_grid(2, 'X')
            board.update_grid(5, 'X')
            board.update_grid(8, 'X')
    
            expect(game_logic.win?(board)).to eq(true)
        end
    
        it "knows a winning game_logic (diagonal left)" do
            game_logic = GameLogic.new
            board = Board.new

            board.update_grid(0, 'X')
            board.update_grid(4, 'X')
            board.update_grid(8, 'X')
    
            expect(game_logic.win?(board)).to eq(true)
        end
    end
    
    context "When game_logic is drawn" do
        it "returns true" do
            game_logic = GameLogic.new
            board = Board.new

            board.update_grid(0, "O")
            board.update_grid(1, "X")
            board.update_grid(2, "O")
            board.update_grid(3, "X")
            board.update_grid(4, "X")
            board.update_grid(5, "O")
            board.update_grid(6, "X")
            board.update_grid(7, "O")
            board.update_grid(8, "X")
    
            expect(game_logic.draw?(board)).to eq(true)
        end
    end
end
