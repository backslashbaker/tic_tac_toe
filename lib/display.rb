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
        print "#{player.marker} wins!\n\n"
    end

    def game_over
        print "Thanks for playing, see you next time!"
    end

    def draw_message
        print "Game has ended as a draw.\n\n"
    end

    def thinking_message
        message_array = ["Hmmmmm I'm thinking...\n\n", "Good move, but watch this...\n\n", "Hmmmm...\n\n", "Really? That's the move?...\n\n", "Your brain is no match for my computing cores!...\n\n", "LOL...\n\n", "LMFAO! You funny human...\n\n", "Come on, are you even trying?...\n\n"]
        print message_array.sample
    end
end