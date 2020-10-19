require_relative '../lib/minimax'

COMPUTER = "X"
HUMAN = "O"

describe Minimax do
    context "#score function" do
        it "calculates the score for a move when X wins" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["X", "O", 3,
                                                      "O", "X", 6,
                                                      "O", 8, "X"])

            expect(minimax.score(board, COMPUTER)).to eq(1)
        end

        context "#score function" do
            it "calculates the score when X wins and board is full" do
                minimax= Minimax.new
                board = double("Board")
                allow(board).to receive(:grid).and_return(["X", "O", "O",
                                                           "O", "X", "X",
                                                           "O", "X", "X"])
                            
                                                
                expect(minimax.minimax(board, COMPUTER)).to eq(1)
            end
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

            expect(minimax.score(board, HUMAN)).to eq(-1)
        end
    end

    context "When the game is over" do
        it "returns the correct score" do
            minimax= Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["X", "O", "O",
                                                       "O", "X", "X",
                                                       "O", "X", "X"])
                        
                                            
            expect(minimax.minimax(board, COMPUTER)).to eq(1)
        end
    end

    context "one empty space" do
        it "returns 9 as only empty space" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["X", "O", "O",
                                                       "O", "X", "X",
                                                       "O", "X", 9])
            
            expect(minimax.empty_spaces(board)).to eq([9])
        end
    end

    context "When there is one space left" do
        it "returns the index of the best move for X to win" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["X", "O", "O",
                                                       "O", "X", "X",
                                                       "O", "X", 9])
            
            expect(minimax.minimax(board, COMPUTER)).to eq(8)
        end
    end

    context "When there is one space left" do
        it "returns the index of the best move for X to win" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return([1, "O", "O",
                                                       "O", "X", "X",
                                                       "O", "X", "X"])
            
            expect(minimax.minimax(board, COMPUTER)).to eq(0)
        end
    end

    context "When there is one space left" do
        it "returns the index of the best move for X to win" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return([1, "X", "O",
                                                      "O", "X", "X",
                                                      "O", 8, "O"])
            
            expect(minimax.minimax(board, COMPUTER)).to eq(7)
        end
    end
end
