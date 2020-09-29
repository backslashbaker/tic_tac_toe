require_relative 'board'

class Display

    def initialize(input, output)
        @input = input
        @output = output
    end

    def welcome 
        @output.puts "Welcome to Tic Tac Toe"
    end

end