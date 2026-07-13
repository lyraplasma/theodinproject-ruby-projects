class Board
  attr_accessor :board
  def initialize
    @board = Array.new(3){Array.new(3) {(1..9).map {|n| n }}}[0][0]
  end
end
