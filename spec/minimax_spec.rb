require_relative '../lib/minimax'

COMPUTER = "X"
HUMAN = "O"

describe Minimax do
    context "#score function" do
        it "calculates the score for a move when X will win" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["X", "O", 3,
                                                      "O", "X", 6,
                                                      "O", 8, "X"])

            expect(minimax.score(board, COMPUTER)).to eq(1)
        end

        it "calculates the score for each move when O wins" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return([1, "O", "X",
                                                      "X", "O", 6,
                                                      "X", "O", 9])

            expect(minimax.score(board, COMPUTER)).to eq(-1)
        end

        it "calculates the score for a draw" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["O", "X", "X",
                                                       "X", "O", "O",
                                                       "X", "O", "X"])

            expect(minimax.score(board, COMPUTER)).to eq(0)
        end

        it "calculates the score when O wins, but from X's perspective" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["O", "X", "X",
                                                       "X", "O", 6,
                                                        7, "O", "O"])

            expect(minimax.score(board, HUMAN, false)).to eq(-1)
        end
    end
end