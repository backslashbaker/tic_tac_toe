require_relative 'board'
require_relative 'player'
require_relative 'display'
require_relative 'game_logic'

class Game

    attr_accessor :board, :turn_counter
    attr_reader :player_one, :player_two, :display, :game_logic

    def initialize
        @board = Board.new
        @player_one = Player.new('O')
        @player_two = Player.new('X')
        @turn_counter = 0
        @display = Display.new($stdin, $stdout)
        @game_logic = GameLogic.new
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
        @display.request_index
        user_index = @display.get_input
        user_index = user_index.to_i - 1
        if @game_logic.valid_move?(@board, user_index)
            move(user_index, current_player)
        else
            @display.error_message
            take_turn
        end
        @display.display_board(@board.grid)
    end

    def play
        @display.welcome_message
        @display.display_board(@board.grid)
        loop do
            until @board.full? or @game_logic.win?(@board)
                take_turn
            end
            break
        end
        @display.display_board(@board.grid)
    end

end

# game = Game.new
# game.play

=begin
To-do:
- game_result method
- make new classes

=end