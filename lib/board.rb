class Board
    attr_accessor :grid

    def initialize
        @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def update_grid(index, marker)
        @grid[index] = marker
    end

    def full?
        if @grid.any?(Integer)
            false
        else
            true
        end
    end

end