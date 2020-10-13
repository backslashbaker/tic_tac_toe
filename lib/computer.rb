class Computer < Player

    COMPUTER = "X"
    HUMAN = "O"

    def move(board)
        index = 0
        while !found do
            if minimax.score(board, empty_spaces[index], COMPUTER) == 1
                found = true
            end
            index += 1
        end
        empty_spaces.each do |space|
            
        end
        return 8
    end

end