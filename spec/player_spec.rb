require_relative '../lib/board'

describe Player do
    
    context "new player" do
        it "instantiates with a marker" do
            user = Player.new("O")

            expect(user.marker).to eq("O")
            
        end

    end
end