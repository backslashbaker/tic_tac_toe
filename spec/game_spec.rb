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

    context "in game" do
        it "updates the board when player_one moves" do
            game = Game.new
            game.move(0, game.player_one)

            expect(game.board.grid[0]).to eq("O")
        end
    end

end

=begin
To-do:
- take_turn method (takes user input, checks valid, if so moves current player then displays board)
- check_valid?
- current_player?
- turn_counter
=end