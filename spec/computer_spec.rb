require_relative '../lib/computer'

describe Computer do
    context "#score function" do
        it "calculates the score for each move" do
            computer = Computer.new("X")
            board = double("Board")
            allow(board).to receive(:grid).and_return(["X", "O", 3, "O", "X", 6, "O", 8, "X"])

            expect(computer.score(board, "X")).to eq("1")
        end
    end

    context "#score function" do
        it "calculates the score for each move" do
            computer = Computer.new("X")
            board = double("Board")
            allow(board).to receive(:grid).and_return([1, "O", "X", "X", "O", 6, "X", "O", 9])

            expect(computer.score(board, "X")).to eq("-1")
        end
    end

    context "when there is one available space" do
        it "plays into that space" do
            computer = Computer.new("X")
            board = double("Board")
            allow(board).to receive(:grid).and_return(["O", "X", "X", "X", "O", "O", "X", "O", 9])

            expect(computer.move(board)).to eq(8)
        end
    end
end


# O X X
# X O O
# X O 9