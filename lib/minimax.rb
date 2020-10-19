class Minimax

    def score(board, marker)
        if three_in_a_row?(board, marker)
            return 1 * multiplier(marker)
        elsif three_in_a_row?(board, opponent(marker))
            return -1 * multiplier(marker)
        else
            return 0
        end
    end

    def minimax(board, marker)
        if game_over?(board, marker)
            return score(board, marker)
        else
            scores_hash = {}
            empty_spaces_array = empty_spaces(board)
            new_board = board.clone
            empty_spaces_array.each { |space| 
                
                new_board.grid[space - 1] = marker
                score = minimax(new_board, opponent(marker))
                scores_hash[space] = score
            
            }
            return scores_hash.first[0] - 1
        end
    end

    def empty_spaces(board)
        board.grid.select { |space| space.is_a?(Integer) }
    end

    private

    def multiplier(marker)
        if marker == "X" 
            1
        else
            -1
        end
    end

    def opponent(marker)
        if marker == "X"
            return "O"
        else
            return "X"
        end
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

    def board_full?(board)
        if board.grid.any?(Integer)
            false
        else
            true
        end
    end

    def game_over?(board, marker)
        if three_in_a_row?(board, marker) or three_in_a_row?(board, opponent(marker)) or board_full?(board)
            return true
        else
            return false
        end
    end

   
end