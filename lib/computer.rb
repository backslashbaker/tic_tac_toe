class Computer < Player

    attr_reader :marker

    def initialize
        @marker = "X"
        @minimax = Minimax.new
    end

    def move(board)
        @minimax.minimax(board, @marker)
    end

end