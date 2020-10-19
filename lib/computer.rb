require_relative 'minimax'

class Computer < Player

    attr_reader :marker
    attr_accessor :minimax

    def initialize
        @marker = "X"
        @minimax = Minimax.new
    end

end