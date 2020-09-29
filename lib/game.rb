require_relative 'board'
require_relative 'player'
require_relative 'display'


class Game

    attr_accessor :board, :turn_counter
    attr_reader :player_one, :player_two

    def initialize
        @board = Board.new
        @player_one = Player.new('O')
        @player_two = Player.new('X')
        @turn_counter = 0
    end

    def welcome_message
        return "Welcome to Tic Tac Toe"
    end

    def display
        return " #{@board.grid[0]} | #{@board.grid[1]} | #{@board.grid[2]} \n------------\n #{@board.grid[3]} | #{@board.grid[4]} | #{@board.grid[5]} \n------------\n #{@board.grid[6]} | #{@board.grid[7]} | #{@board.grid[8]} "
    end

    def move(index, player)
        @board.update_grid(index, player.marker)
        @turn_counter += 1
    end

    def current_player
        if @turn_counter.even?
            @player_one
        else
            @player_two
        end
    end

    def take_turn
        puts "Please enter a number from 1-9"
        user_index = gets.chomp
        user_index = user_index.to_i - 1
        if @board.valid_move?(user_index)
            move(user_index, current_player)
        else
            take_turn
        end
        puts display
    end

    #def play
        #puts welcome_message
        #puts display
        #take_turn
    #end

end

#game = Game.new
#game.play

=begin
To-do:
- play method (running =true. welcome message, displays board, while running: if board isnt full/winner/draw, then take turn, else, running = false, return game_result)
- game_result method

=end