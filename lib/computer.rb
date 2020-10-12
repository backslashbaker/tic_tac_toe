class Computer < Player

    attr_reader :marker

    def initialize(marker)
        @marker = marker
    end

end

=begin
MINIMAX

How the algorith works:

If the game is over, return the score from computer's perspective (+/- 1).
Otherwise, get a list of new game states for every possible move.
Create a scores list
For each of these states add the minimax result of that state to the scores list
If it's X's turn, return the maximum score from the scores list
If it's O's turn, return the minimum score from the scores list

Minimax checks first available move on the board and if this is end of game. If it isn't it calls itself and passes in this new board state.
Minimax knows it is opponents turn and again checks first available move. If this represents a win for the opponent, the board is assigned a state of -1.
Algorithm iterates onto the next move the opponent could make. If this represents a win for the opponent, the board is assigned a state of -1.
Having considered all moves on this level, the algorithm assumes the opponent will play perfectly and assigns the score for the first move a -1.
Moves onto second branch, computer's turn. Algorithm continues...
https://medium.com/@sjones_47524/minimax-and-the-art-of-unbeatable-tic-tac-toe-3c93dfeb0e65
=end