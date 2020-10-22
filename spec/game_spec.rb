require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do

    context "in game" do
        it "updates the board when player_one moves" do
            game = Game.new(Human.new, Human.new)
            game.player_one.marker = "X"
            game.player_one.move(0, game.board)

            expect(game.board.grid[0]).to eq("X")
        end
    end

    context "in game" do
        it "updates current_player when player_one moves" do
            game = Game.new(Human.new, Human.new)
            game.player_one.marker = "X"
            
            expect(game.current_player).to eq(game.player_one)
        end

        it "updates current_player when player_one moves" do
            game = Game.new(Human.new, Human.new)
            game.player_one.marker = "X"
            allow($stdin).to receive(:gets).and_return(1, "quit")
            game.play

            expect(game.current_player).to eq(game.player_two)
        end
    end

    context "user takes turn" do
        it "takes user input and marks a valid move" do
            game = Game.new(Human.new, Human.new)
            game.player_one.marker = "X"
            allow($stdin).to receive(:gets).and_return(1, "quit")
            game.play

            expect(game.board.grid[0]).to eq "X"
        end
    end

end