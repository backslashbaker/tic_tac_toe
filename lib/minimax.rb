class Minimax

    def score(board, index, marker)
        updated_board = new_board(board, index, marker)
        if three_in_a_row?(updated_board, marker)
            return "1"
        elsif three_in_a_row?(updated_board, other_marker(marker))
            return "-1"
        else
            #score(new_board, index, other_marker)
            #board = new_board(board, index, marker)
            #self.score
            return "0"
            #needs to score every possiblity 
            #needs to call itself 
        #take board and place marker in position given
        end 
    end

    def new_board(board, index, marker)
        board.grid[index] = marker
        return board.grid
    end

    def other_marker(current_marker)
        if current_marker == "X"
            return "O"
        else
            return "X"
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

    def board_full?(board)
        if board.grid.any?(Integer)
            false
        else
            true
        end
    end

    def game_over?(board, marker, human_marker)
        if three_in_a_row?(board, marker) or three_in_a_row?(board, human_marker) or board_full?(board)
            return true
        else
            return false
        end
    end

#     def draw?(board)
#         if board.full? && !win?(board)
#             return true
#         end
#         return false
#     end


#     def game_result(board, player)
#         if win?(board)
#             return player
#         else
#             return nil
#         end
#     end

#     private 

#     def empty?(board, index)
#         if board.grid[index].is_a?(Integer)
#             return true
#         end
#         return false
#     end

end