require_relative '../lib/minimax'
require_relative '../lib/game_logic'

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

            expect(minimax.get_best_move(board, COMPUTER)).to eq(1)
        end

        context "#score function" do
            it "calculates the score when X wins and board is full" do
                minimax= Minimax.new
                board = double("Board")
                allow(board).to receive(:grid).and_return(["X", "O", "O",
                                                           "O", "X", "X",
                                                           "O", "X", "X"])
                            
                                                
                expect(minimax.get_best_move(board, COMPUTER)).to eq(1)
            end
        end

        it "calculates the score for each move when O wins" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return([1, "O", "X",
                                                      "X", "O", 6,
                                                      "X", "O", 9])

            expect(minimax.get_best_move(board, COMPUTER)).to eq(-1)
        end

        it "calculates the score for a draw" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["O", "X", "X",
                                                       "X", "O", "O",
                                                       "X", "O", "X"])
            allow(board).to receive(:full?).and_return(true)

            expect(minimax.get_best_move(board, COMPUTER)).to eq(0)
        end
    end

    context "When the game is over" do
        it "returns the correct score" do
            minimax= Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["X", "O", "O",
                                                       "O", "X", "X",
                                                       "O", "X", "X"])
                        
                                            
            expect(minimax.get_best_move(board, COMPUTER)).to eq(1)
        end
    end

    context "When there is one space left" do
        it "returns the index of the best move for X to win" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["X", "O", "O",
                                                       "O", "X", "X",
                                                       "O", "X", 9])
            allow(board).to receive(:full?).and_return(false)
            
            expect(minimax.get_best_move(board, COMPUTER)).to eq(8)
        end
    end

    context "When there is one space left" do
        it "returns the index of the best move for X to win" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return([1, "O", "O",
                                                       "O", "X", "X",
                                                       "O", "X", "X"])
            allow(board).to receive(:full?).and_return(false)
            
            expect(minimax.get_best_move(board, COMPUTER)).to eq(0)
        end
    end

    context "When there are two spaces left" do
        it "returns the index of the best move for X to win" do
            minimax = Minimax.new
            board = double("Board")
            allow(board).to receive(:grid).and_return([1, "X", "O",
                                                      "O", "X", "X",
                                                      "O", 8, "O"])
            allow(board).to receive(:full?).and_return(false)

            expect(minimax.get_best_move(board, COMPUTER)).to eq(7)
        end

        context "When there are three spaces left" do
            it "returns the index of the best move for X to win" do
                minimax = Minimax.new
                board = double("Board")
                allow(board).to receive(:grid).and_return([1, "X", "O",
                                                           4, "X", "X",
                                                           "O", 8, "O"])
                allow(board).to receive(:full?).and_return(false)

                expect(minimax.get_best_move(board, COMPUTER)).to eq(3)
            end
        end

        context "When there are three spaces left" do
            it "returns the index of the best move for X to win in the future" do
                minimax = Minimax.new
                board = double("Board")
                allow(board).to receive(:grid).and_return(["O", "X", 3,
                                                           "X", "X", "O",
                                                           7, "O", 9])
                allow(board).to receive(:full?).and_return(false)
                
                expect(minimax.get_best_move(board, COMPUTER)).to eq(2)
            end
        end
    end
end
