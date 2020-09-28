class Board
    attr_accessor :grid

    def initialize
        @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    WINNING_COMBINATIONS = [
        [0, 1, 2], # top row
        [3, 4, 5], # middle row
        [6, 7, 8], # bottom row
        [0, 3, 6], # left vertical
        [1, 4, 7], # middle vertical
        [2, 5, 8], # right vertical
        [0, 4, 8], # diagonal left
        [2, 4, 6] # diagonal right
    ]

    def display
        return " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} \n------------\n #{@grid[3]} | #{@grid[4]} | #{@grid[5]} \n------------\n #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    end

    def update_grid(index, marker)
        @grid[index] = marker
    end

    def valid_move?(index)
        if empty?(index) && index >= 0 && index <= 8
            return true
        else
            false
        end
    end

    def full?
        if @grid.all? { |square| square == 'X' || square == 'O'}
            true
        else
            false
        end
    end

    def win?
        WINNING_COMBINATIONS.each { |combination|
            if (@grid[combination[0]] == @grid[combination[1]]) && (@grid[combination[1]] == @grid[combination[2]])
                return true
            end
        }
        return false
    end

    def draw?
        if full? && !win?
            return true
        end
        return false
    end

    private 

    def empty?(index)
        if @grid[index].is_a?(Integer)
            return true
        end
        return false
    end

end