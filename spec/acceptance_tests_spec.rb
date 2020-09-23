require_relative '../lib/board'
require_relative '../lib/player'

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
            user = Player.new('O')
            ai = Player.new('X')
            game = Game.new
           

            game.take_turn(0, 0, user)
           

            expect(board.display).to eq(" O |   |   \n------------\n   |   |   \n------------\n   |   |   ")
        end

    end

    context "within a game" do
        it "can decide if the player has won or not" do
            board = Board.new
            user = Player.new('O')
            ai = Player.new('X')
            game = Game.new(board, user, ai)
           

            game.take_turn(0, 0)
            

            expect(board.display).to eq(" O | X |   \n------------\n   |   |   \n------------\n   |   |   ")
        end

    end

end