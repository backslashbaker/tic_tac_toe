class Board
    attr_accessor :grid

    def initialize
        @grid = [[" ", " ", " "], 
                 [" ", " ", " "],
                 [" ", " ", " "]]
    end

    def display
        return " #{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]} \n------------\n #{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]} \n------------\n #{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]} "
    end

    def update_grid(row, column, marker)
        @grid[row][column] = marker
    end

end