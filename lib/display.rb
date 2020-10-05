require_relative 'board'

class Display

    def initialize(input, console)
        @input = input
        @console = console
    end

    def welcome_message 
        @console.print "Welcome to Tic Tac Toe\n\n"
    end

    def display_board(grid)
       @console.print " #{grid[0]} | #{grid[1]} | #{grid[2]} \n------------\n #{grid[3]} | #{grid[4]} | #{grid[5]} \n------------\n #{grid[6]} | #{grid[7]} | #{grid[8]} \n\n"
    end

    def get_input
        @input.gets
    end

    def request_index
        @console.print "Please choose a number between 1 - 9: "
    end

    def error_message
        @console.print "Input error. Try again.\n"
    end

    def game_result_message(player)
        @console.print "#{player.marker} wins!"
    end
end

=begin
 To-do:
 - print messages to assign markers
 - display current player?
 - asks for a new game
 - display a win/draw message
=end