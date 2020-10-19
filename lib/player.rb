class Player

    attr_accessor :marker

    def initialize(marker)
        @marker = marker
    end

    def move(index, board)
        board.update_grid(index, @marker)
    end

end