require_relative "lib/game"
# Current class: Board, Player

def main
  game
  print("Play again?(y/n) ")
  ask=Kernel.gets.chomp; if ask.eql?("y") then game else end
end; main

=begin
Invoke main
loops
  breaks loop via game class?
game class :: win? then break?
game.win? will return bool to break the game loop?

inside of main
break if game.end?
then it'll spawn new game?

X add player class for game state?

=end
