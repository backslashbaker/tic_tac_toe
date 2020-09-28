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
        xit "allows the user to mark 'O' on the board" do
            game = Game.new
           
            game.move(0, 0, @player_one)
           
            expect(board.display).to eq(" O |   |   \n------------\n   |   |   \n------------\n   |   |   ")
        end

    end

    context "within a game" do
        xit "can decide if the player has won or not" do
            game = Game.new
           

            game.move(0, 0)
            

            expect(board.display).to eq(" O | X |   \n------------\n   |   |   \n------------\n   |   |   ")
        end

    end

    context "within a game" do
        xit "can decide if the player has won or not" do
            game = Game.new
           

            game.move(0, 0)
            

            expect(board.display).to eq(" O | X |   \n------------\n   |   |   \n------------\n   |   |   ")
        end

    end

end