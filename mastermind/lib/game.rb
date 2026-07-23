require_relative "game/computer"
require_relative "game/board"
require_relative "game/human"

class Game
  attr_accessor :b, :c
  def initialize
    #################### TODO
    @b = Board.new
    # ^^^ slice board's methods to codemkr ^ codebrker
    @c = Computer.new #             <
    @h = Human.new #                <
    # ^^^ codemaker's & codebreaker |
    ####################
  end
=begin
GAME START: human choose: codemaker or codebreaker
then?
#sltion1:
def human_as_breaker, def human_as_maker <<< not dry
#sltion2:
adding @role, create another class Player << includes Codemaker, Codebreaker and @role
it'll avoid dups of include on Humn and Comp,
class Computer < Player, class Human < Player
=end
  # CACHE: implement how to separate modes of human as maker or breaker as args on game class
  def play?
      self.get_role # human's role


    12.times.with_index do |round|
     # ^^^^ limited by 12 rounds, binds to the init var of board's vector
      b.clear_checked_slots # still board's?
      if %w(codebreaker breaker 1).include?(@h.role)
        @h.place_numbers(round, @b)
      elsif %w(2 maker codemaker).include?(@h.role)
        @c.place_numbers(round, @b)
      end


#      b.add_number_slot(round) # << comp or humn 's codebreaker
      b.match_secret_code(round, c.secret_code) # still board's?
      b.display_hints(round) # board's
      if b.win? then puts "\t\tYou win!"; return true end # should board handle the judge?
      # ^^^^^^ or codemaker's?
    end
    return false
  end

  def get_role # TODO: requires rewrite :: too bloaty, remove human's ins var?
    print "\t\t S E L E C T   R O L E:\n\t[1]: c o d e b r e a k e r\n\t[2]: c o d e m a k e r\n> > > > "
    while @h.role = Kernel.gets.chomp
      print "\t(1) codebreaker\n\t(2) codemaker\n\t>>>> "
      break if %w(1 2 codebreaker breaker maker codemaker).include?(@h.role) end
=begin
    if %w(1 breaker codebreaker).include?(@h.role) # human'class really need role var? for future stuff?
      return
    end
=end
  end
end
# TODO: Migrate board's input methods on codebreaker class DONE?CONFIRMING...
