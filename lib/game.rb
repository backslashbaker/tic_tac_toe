require_relative 'board'
require_relative 'player'



class Game

    attr_accessor :board
    attr_reader :player_one, :player_two

    def initialize
        @board = Board.new
        @player_one = Player.new('O')
        @player_two = Player.new('X')
    end

    def welcome_message
        return "Welcome to Tic Tac Toe"
    end

    def move(index, player)
        @board.update_grid(index, player.marker)
    end
end