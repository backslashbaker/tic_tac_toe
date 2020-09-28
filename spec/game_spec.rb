require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
    
    context "new game" do
        it "it displays a welcome message to users" do
            game = Game.new

            expect(game.welcome_message).to eq 'Welcome to Tic Tac Toe'
        end

    end
end