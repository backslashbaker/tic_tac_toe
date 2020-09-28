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

    def display
        return " #{@board.grid[0]} | #{@board.grid[1]} | #{@board.grid[2]} \n------------\n #{@board.grid[3]} | #{@board.grid[4]} | #{@board.grid[5]} \n------------\n #{@board.grid[6]} | #{@board.grid[7]} | #{@board.grid[8]} "
    end

    def move(index, player)
        @board.update_grid(index, player.marker)
    end

end