require_relative '../lib/minimax'

COMPUTER = "X"
HUMAN = "O"

describe Minimax do
    context "#score function" do
        xit "calculates the score for each move when X wins" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return([1, "O", 3,
                                                      "O", "X", 6,
                                                      "O", 8, "X"])

            expect(minimax.score(board, 0, COMPUTER)).to eq("1")
        end
    end

    context "#score function" do
        xit "calculates the score for each move when O wins" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return([1, 2, "X",
                                                      "X", "O", 6,
                                                      "X", "O", 9])

            expect(minimax.score(board, 1, HUMAN)).to eq("-1")
        end
    end

    context "#score function" do
        xit "calculates the score for a draw" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["O", "X", "X",
                                                       "X", "O", "O",
                                                       "X", "O", "X"])

            expect(minimax.score(board, "X", "O")).to eq("0")
        end
    end

    context "#other_marker function" do
        it "returns O when current player is X" do
            minimax = Minimax.new

            expect(minimax.other_marker("X")).to eq("O")
        end
    end

    context "#other_marker function" do
        it "returns O when current player is X" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return([1, "O", 3,
                                                      "O", "X", 6,
                                                      "O", 8, "X"])

            expect(minimax.new_board(board, 0, COMPUTER)).to eq(["X", "O", 3,
                                                                "O", "X", 6,
                                                                "O", 8, "X"])
        end
    end
end