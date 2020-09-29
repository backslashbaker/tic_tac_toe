require_relative 'board'
require_relative 'player'
require_relative 'display'


class Game

    attr_accessor :board, :turn_counter
    attr_reader :player_one, :player_two, :display

    def initialize
        @board = Board.new
        @player_one = Player.new('O')
        @player_two = Player.new('X')
        @turn_counter = 0
        @display = Display.new($stdin, $stdout)
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
        puts " \n Please enter a number from 1-9"
        user_index = @display.get_input
        user_index = user_index.chomp.to_i - 1
        if @board.valid_move?(user_index)
            move(user_index, current_player)
        else
            take_turn
        end
        puts @display.display_board(@board.grid)
    end

    #def play
        #@display.welcome_message
        #puts ""
        #@display.display_board(@board.grid)
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