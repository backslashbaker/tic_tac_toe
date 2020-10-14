=begin
    Computer (X) is max so it will always choose the move that results in the highest score for them
    Human (O) is min so it will always choose the move that results in the lowest score for X
    We see everything through the perspective of X
=end

class Minimax
    
    def minimax(board, player_marker, opponent_marker)
        if game_over
            return score(board, player_marker) # score from perspective of the player
        else 
            scores_hash = {}
            empty_spaces_array = empty_spaces(board) #iterate over each possible move based on current state of board
            empty_spaces_array.each { |space|
                
                new_board = board.clone
                new_board[space] = player_marker # create a state reflecting the board as it looks after the move is made
                score = minimax(new_board, opponent_marker, player_marker) # call minimax on new state to see if game over position has been reached
                scores_hash[space] = score # add this board state to a hash with its score?

                # if not game over, we iterate again over the empty spaces but now we are filling spaces with the opponents marker and calling minimax on the resulting state
                # continue calling minimax until an end state is reached
                # from all these possible paths, select the move that leads to the maximum possible score and return this move
            }
            # algorithm compares all the moves the player/opponent could make
            # if it is opponent's turn, it returns the minimum value in the hash
            # if it is the player's turn, it returns the maximum value in the hash
            # now exits this call of minimax and passes this value up the chain so the move in the first empty space is assigned a score
            # 


                # if score(board_copy, space - 1, marker) == 1 # computer gets three in a row by placing here
                #     scores_hash[space] = 1
                #     break
                

            }
        end
    end

    def empty_spaces(board)
        return empty_spaces_array
    end

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