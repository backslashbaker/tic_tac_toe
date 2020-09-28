class Board
    attr_accessor :grid

    def initialize
        @grid = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        return " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} \n------------\n #{@grid[3]} | #{@grid[4]} | #{@grid[5]} \n------------\n #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    end

    def update_grid(index, marker)
        @grid[index] = marker
    end

    def valid_move?(index)
        if ["", " ", nil].include?(@grid[index])
            return true
        else
            false
        end
    end

end