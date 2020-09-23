require_relative 'board'
require_relative 'player'



class Game

    attr_accessor :board
    attr_reader :player_one, :player_two

    def initialize(board, player_one, player_two)
        @board = board
        @player_one = player_one
        @player_two = player_two
    end

    def take_turn(row, col, player)
        board = Board.new
        user = Player.new('O')
        ai = Player.new('X')
        @board.update_grid(row, col, player.marker)
    end
end