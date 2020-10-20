require_relative 'lib/game'
require_relative 'lib/minimax'

computer = Computer.new
human = Human.new

game = Game.new(computer, human)
game.play