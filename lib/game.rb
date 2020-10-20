require_relative 'board'
require_relative 'player'
require_relative 'human'
require_relative 'display'
require_relative 'game_logic'
require_relative 'computer'

class Game

    attr_accessor :board, :turn_counter
    attr_reader :player_one, :player_two, :display, :game_logic

    def initialize(player_one, player_two)
        @board = Board.new
        @player_one = player_one
        @player_two = player_two
        @display = Display.new
        @game_logic = GameLogic.new
        @turn_counter = 0
        @game_over = false
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

    def human_take_turn
        @display.request_index
        user_index = $stdin.gets
        if user_index.to_s.chomp == "q" or user_index.to_s.chomp == "quit"
            @game_over = true
        else
            user_index = user_index.to_i - 1
            if @game_logic.valid_move?(@board, user_index)
                current_player.move(user_index, @board)
                @turn_counter += 1
            else
                @display.error_message
            end
        end
    end

    def computer_take_turn
        if @turn_counter == 0
            random_index = rand(0..8)
            current_player.move(random_index, board)
            @turn_counter += 1
        else
            index = current_player.minimax.minimax(@board, current_player.marker)
            current_player.move(index, board)
            @turn_counter += 1
        end
    end

    def play
        @display.welcome_message
        loop do
            until @board.full? or @game_logic.win?(@board) or @game_over
                if current_player.is_a?(Human)
                    @display.display_board(@board.grid)
                    human_take_turn
                    puts ""
                else
                    computer_take_turn
                end             
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