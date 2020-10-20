# Tic Tac Toe

## To-Do list
- [x] change `take_turn` method to `human_take_turn` in game file
- [x] change `move` function to `current_player.move`
- [x] add in `if current_player.is_a?(Human)` after `until` statement in `play` function 
- [x] add a `move` function for Player (and tests)
- [x] tests will fail - swap X's & O's and initalise with two Humans and overwrite player one's marker?
- [x] create `computer_take_turn` method in game
- [ ] make methods in game private
- [ ] import game_logic to minimax
- [ ] add messages for computer 
- [ ] add computer choice delay to game flow

## MoSCoW

### Must
- implement minimax
- have Computer start the game

### Should 
- have Computer print messages

### Could 
- use colour on empty cells
- ask to play again
- Display current player

### Won't
- request markers
- request Human v Human, or Human v Computer

## Minimax

### How the algorithm works:

- If the game is over, return the score from computer's perspective (+/- 1).
- Otherwise, get a list of new game states for every possible move.
- Create a scores list
- For each of these states add the minimax result of that state to the scores list
- If it's X's turn, return the maximum score from the scores list
- If it's O's turn, return the minimum score from the scores list

Links: https://medium.com/@sjones_47524/minimax-and-the-art-of-unbeatable-tic-tac-toe-3c93dfeb0e65
