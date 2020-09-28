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

    def take_turn(row, col, player)
        @board.update_grid(row, col, player.marker)
    end
end