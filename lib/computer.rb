class Computer < Player

    attr_reader :marker

    def initialize(marker)
        @marker = marker
    end

    def score(board, marker)
        if three_in_a_row?(board, marker)
            return "1"
        else
            return "-1"
        end
    end


    # ====== Taken from GameLogic ======

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

    def three_in_a_row?(board, marker)
        WINNING_COMBINATIONS.each { |combination|
            if (board.grid[combination[0]] == marker) and 
                (board.grid[combination[0]] == board.grid[combination[1]]) and
                (board.grid[combination[1]] == board.grid[combination[2]])
                return true
            end
        }
        return false
    end

    def draw?(board)
        if board.full? && !win?(board)
            return true
        end
        return false
    end

    def game_result(board, player)
        if win?(board)
            return player
        else
            return nil
        end
    end

    private 

    def empty?(board, index)
        if board.grid[index].is_a?(Integer)
            return true
        end
        return false
    end
end