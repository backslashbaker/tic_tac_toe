class Minimax

    def score(board, marker, comp = true)
        if three_in_a_row?(board, marker)
            return 1 * multiplier(comp)
        elsif three_in_a_row?(board, opponent(marker))
            return -1 * multiplier(comp)
        else
            return 0
        end
    end

    def minimax(board, marker)
        if game_over?(board, marker)
            return 0
        else
            scores_hash = {}
            empty_spaces_array = empty_spaces(board)
            empty_spaces_array.each { |space| 

                new_board = board.clone
                new_board.grid[space] = marker
                score = 1 #minimax(new_board, opponent(marker))
                scores_hash[space] = score
            
            }
            return scores_hash.first[0] - 1
        end
    end

    def empty_spaces(board)
        board.grid.select { |space| space.is_a?(Integer) }
    end

    private

    def multiplier(comp = true)
        if comp 
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