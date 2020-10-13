require_relative '../lib/computer'

describe Computer do
    context "when there is one available space" do
        xit "plays into that space" do
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