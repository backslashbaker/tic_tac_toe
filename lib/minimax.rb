require_relative 'board'
require_relative 'game_logic'

class Minimax
    
    def initialize
        @game_logic = GameLogic.new
    end

    def get_best_move(board, marker, depth=0)
        if @game_logic.game_over?(board, marker)
            return score(board, marker)
        else
            scores_hash = {}
            empty_spaces_array = empty_spaces(board)
            empty_spaces_array.each { |space| 
                
                new_board = Board.new
                new_board.grid = board.grid.map(&:dup)
                new_board.grid[space - 1] = marker
                score = -1 * get_best_move(new_board, @game_logic.opponent(marker), depth+1)
                scores_hash[space] = score
            
            }
            evaluate_score(depth, scores_hash)
        end
    end

    private

    def score(board, marker)
        if @game_logic.three_in_a_row?(board, marker)
            return 1
        elsif @game_logic.three_in_a_row?(board, @game_logic.opponent(marker))
            return -1
        else
            return 0
        end
    end

    def evaluate_score(depth, scores_hash)
        if depth == 0 
            return scores_hash.max_by { |key, value| value }[0] - 1
        else
            return scores_hash.max_by { |key, value| value }[1]
        end
    end

    def empty_spaces(board)
        board.grid.select { |space| space.is_a?(Integer) }
    end
end