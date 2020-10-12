require_relative '../lib/computer'

describe Computer do
    context "#score function" do
        it "calculates the score for each move" do
            computer = Computer.new

            expect(computer.score).to eq()
        end
    end
end