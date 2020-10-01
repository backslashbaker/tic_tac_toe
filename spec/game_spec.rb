require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do

    context "in game" do
        it "updates the board when player_one moves" do
            game = Game.new
            game.move(0, game.player_one)

            expect(game.board.grid[0]).to eq("O")
        end
    end

    context "in game" do
        it "updates turn_counter when player_one moves" do
            game = Game.new
            game.move(0, game.player_one)

            expect(game.turn_counter).to eq(1)
        end
    end

    context "in game" do
        it "updates turn_counter when player_one moves" do
            game = Game.new

            expect(game.current_player).to eq(game.player_one)
        end

        it "updates turn_counter when player_one moves" do
            game = Game.new
            game.move(0, game.player_one)

            expect(game.current_player).to eq(game.player_two)
        end
    end

    context "user takes turn" do
        it "takes user input and marks a valid move" do
            game = Game.new
            allow($stdin).to receive(:gets).and_return(1)
            game.take_turn

            expect(game.board.grid[0]).to eq "O"
        end
    end

end