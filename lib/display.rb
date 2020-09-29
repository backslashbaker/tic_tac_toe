require_relative 'board'

class Display

    def initialize(input, output)
        @input = input
        @output = output
    end

    def welcome_message 
        @output.print "Welcome to Tic Tac Toe\n"
        @output.puts ""
    end

    def display_board(grid)
        @output.print " #{grid[0]} | #{grid[1]} | #{grid[2]} \n------------\n #{grid[3]} | #{grid[4]} | #{grid[5]} \n------------\n #{grid[6]} | #{grid[7]} | #{grid[8]} \n"
        @output.puts ""
    end

    def get_input
        @input.gets
    end

    def request_index
        @output.print "Please choose a number between 1 - 9: "
    end

    def error_message
        @output.print "Input error. Try again.\n"
    end
end