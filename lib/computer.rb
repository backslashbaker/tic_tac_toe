class Computer < Player

    attr_reader :marker

    def initialize
        @marker = "X"
    end

    def move(board)
        board.grid.each_with_index { |space, index|
            if space.is_a?(Integer)
                return index
            end
        }
        # index = 0
        # while !found do
        #     if minimax.score(board, empty_spaces[index], @marker) == 1
        #         found = true
        #     end
        #     index += 1
        # end
        # empty_spaces.each do |space|
            
        # end
    end

end