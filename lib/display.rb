require_relative 'board'

class Display

    def welcome_message 
        print "Welcome to Tic Tac Toe\n\n"
    end

    def display_board(grid)
       print " #{grid[0]} | #{grid[1]} | #{grid[2]} \n------------\n #{grid[3]} | #{grid[4]} | #{grid[5]} \n------------\n #{grid[6]} | #{grid[7]} | #{grid[8]} \n\n"
    end

    def request_index
        print "Please choose a number between 1 - 9: "
    end

    def error_message
        print "Input error. Try again.\n"
    end

    def game_result_message(player)
        print "#{player.marker} wins!"
    end

    def game_over
        print "Thanks for playing, see you next time!"
    end
end

=begin
 To-do:
 - print messages to assign markers
 - display current player?
 - asks for a new game
 - display a win/draw message
=end