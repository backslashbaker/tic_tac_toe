require_relative '../lib/computer'

describe Computer do
    context "when there is one available space" do
        it "plays into that space" do
            computer = Computer.new
            board = double("Board")
            allow(board).to receive(:grid).and_return(["O", "X", "X", "X", "O", "O", "X", "O", 9])

            expect(computer.move(board)).to eq(8)
        end
    end
end