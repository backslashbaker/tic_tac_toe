require_relative 'minimax'

class Computer < Player

    attr_reader :marker, :minimax

    def initialize
        @marker = "X"
        @minimax = Minimax.new
    end

end