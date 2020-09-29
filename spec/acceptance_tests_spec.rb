require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game'

describe Board do

    context "within a game" do
        xit "can make one valid move" do
            game = Game.new
            game.take_turn

            expect(game.display).to eq(" O | 2 | 3 \n------------\n 4 | 5 | 6 \n------------\n 7 | 8 | 9 ")
        end
    end

end