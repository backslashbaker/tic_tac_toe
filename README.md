# Tic Tac Toe

## To-Do list

### Must
- implement minimax
- create Human and Computer subclasses of Player
- inject dependencies into Game initialisation

### Should 
- request Human v Human, or Human v Computer

### Could 
- request markers
- use colour on empty cells
- ask to play again
- Display current player

### Won't


## Minimax

### How the algorith works:

- If the game is over, return the score from computer's perspective (+/- 1).
- Otherwise, get a list of new game states for every possible move.
- Create a scores list
- For each of these states add the minimax result of that state to the scores list
- If it's X's turn, return the maximum score from the scores list
- If it's O's turn, return the minimum score from the scores list

Links: https://medium.com/@sjones_47524/minimax-and-the-art-of-unbeatable-tic-tac-toe-3c93dfeb0e65
