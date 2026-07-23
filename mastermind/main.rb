require_relative "lib/game"

g = Game.new
if g.play? == false then puts "You lose" end
