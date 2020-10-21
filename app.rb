require_relative 'lib/game'
require_relative 'lib/minimax'

computer = Computer.new
human = Human.new

game = Game.new(human, computer)
game.play