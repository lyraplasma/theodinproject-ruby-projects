require "colorize"
class Player
  attr_accessor :player_move, :name, :score
#  def am_i_winning?
  #  end
  def initialize(name)
    self.name = name
    self.score = 0
  end
  def add_points
    self.score += 1
  end
  def take_move
    loop do
      print "\t\t>>>>> #{self.name} ".colorize(:green)
      self.player_move = gets.chomp # possible value collision?
      break if /[a-i]/.match?(self.player_move)
    end
  end
end
=begin
Player obj
vars: player_mv,
instance arg of board from Board class?

==========
factory method possible?

==========

====================
Inheritance from x? possible?
board's & player's similarities?
...
Board class: spawns board state...
Player class: handles player's mv?
Game class no longer needed?
hw bout using mixins? modules? shared methods?

====================
=end


