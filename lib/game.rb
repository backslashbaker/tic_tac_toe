require_relative 'board'
require_relative 'player'
require_relative 'human'
require_relative 'display'
require_relative 'game_logic'

class Game

    attr_accessor :board, :turn_counter
    attr_reader :player_one, :player_two, :display, :game_logic

    def initialize
        @board = Board.new
        @player_one = Human.new('O')
        @player_two = Human.new('X')
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
        if user_index.to_s.chomp == "q" or user_index.to_s.chomp == "quit"
            @game_over = true
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
        if @game_over
            @display.game_over
        elsif @game_logic.game_result(@board, previous_player) == nil
            @display.draw_message
            @display.display_board(@board.grid)
        else
            @display.game_result_message(previous_player)
            @display.display_board(@board.grid)
        end
    end

    # def run
    #     running = true
    #     while running
    #         play
    #         @display.play_again
    #         user_choice = $stdin.gets.chomp
    #         if user_choice == "Y"
    #             @board.clear
    #             #@turn_counter = 0
    #             @display.new_game
    #             run
    #         else
    #             running = false
    #             @display.game_over
    #         end
    #     end
    # end

end

# game = Game.new
# game.play

