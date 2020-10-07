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
        @display = Display.new
        @game_logic = GameLogic.new
        @turn_counter = 0
        @game_over = false
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

    def previous_player
        if turn_counter.odd?
            @player_one
        else
            player_two
        end
    end

    def take_turn
        @display.request_index
        user_index = $stdin.gets
        if ["q", "quit"].include?(user_index)
            @game_over = true
            @display.game_over
        else
            user_index = user_index.to_i - 1
            if @game_logic.valid_move?(@board, user_index)
                move(user_index, current_player) 
            else
                @display.error_message
            end
        end
    end

    def play
        @display.welcome_message
        loop do
            until @board.full? or @game_logic.win?(@board) or @game_over
                @display.display_board(@board.grid)
                take_turn
                puts ""
            end
            break
        end
        if @game_logic.game_result(@board, previous_player) == nil
            @display.draw_message
            @display.display_board(@board.grid)

        else
            @display.game_result_message(previous_player)
            @display.display_board(@board.grid)

        end
        #@display.game_result_message(previous_player)
    end

    def run
        running = true
        play
        @display.play_again
        play_again = $stdin.gets
        
        if play_again == "Y"
            play
        else
            running = false
            @display.game_over
        end
    end

end

#  game = Game.new
#  game.run

