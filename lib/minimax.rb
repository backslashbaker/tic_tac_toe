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

    def minimax(board, marker, depth= 0)
        if game_over?(board, marker)
            return score(board, marker)
        else
            scores_hash = {}
            empty_spaces_array = empty_spaces(board)
            p empty_spaces_array
            empty_spaces_array.each { |space| 

                p "Now looking at space #{space} with depth #{depth}"
                
                new_board = board.clone
                new_board.grid[space - 1] = marker
                score = minimax(new_board, opponent(marker), depth+1)
                p "Space: #{space} score: #{score}"
                scores_hash[space] = score
                p "New scores hash is #{scores_hash}"
            
            }
            p "Left each loop"
            p "Scores hash is #{scores_hash}"
            p scores_hash.max_by { |key, value| value }
            evaluate_score(depth, scores_hash)
        end
    end

    def empty_spaces(board)
        board.grid.select { |space| space.is_a?(Integer) }
    end

    private

    def evaluate_score(depth, scores_hash)
        if depth == 0 
            return scores_hash.max_by { |key, value| value }[0] - 1
        else
            return scores_hash.max_by { |key, value| value }[1]
        end
    end

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