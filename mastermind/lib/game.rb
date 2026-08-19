=begin
let_board >> instance_obj_type :)))
=end
require_relative "game/computer"
require_relative "game/board"
require_relative "game/human"

class Game
  attr_accessor :let_board, :let_computer, :let_human # hits hard, now i learned that you must name your variables properly :))
  def initialize
    #################### TODO
    @let_board = Board.new
    # ^^^ slice board's methods to codemkr ^ codebrker
    @let_computer = Computer.new #             <
    @let_human = Human.new #                <
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
  def play?
    self.get_role # @NOTICE human's role
    @let_human.ask_secret_code if %w(2 maker codemaker).include?(@let_human.role)
    12.times.with_index do |round|
     # ^^^^ limited by 12 rounds, binds to the init var of board's vector
      let_board.clear_checked_slots # still board's? # NOTICE: from the attr_accessor
      if %w(codebreaker breaker 1).include?(@let_human.role)
        @let_human.place_numbers(round, @let_board)
        @let_board.match_secret_code(round, @let_computer.secret_code)
      elsif %w(2 maker codemaker).include?(@let_human.role) # INPROGRESS: CACHE : comp's breaker role
        @let_computer.place_numbers(round, @let_board)
        @let_board.match_secret_code(round, @let_human.secret_code) 
      end


#      b.add_number_slot(round) # << comp or humn 's codebreaker

      @let_board.display_hints(round) # board's
########################################
########################################
      if @let_board.win? then puts "\t\tYou win!"; return true end # should board handle the judge?
      # ^^^^^^ or codemaker's?
    end
    return false
  end

  def get_role # TODO: requires rewrite :: too bloaty, remove human's ins var?
    print "\t\t S E L E C T   R O L E:\n\t[1]: c o d e b r e a k e r\n\t[2]: c o d e m a k e r\n> > > > "
    while @let_human.role = Kernel.gets.chomp
      print "\t(1) codebreaker\n\t(2) codemaker\n\t>>>> "
      break if %w(1 2 codebreaker breaker maker codemaker).include?(@let_human.role) end
=begin
    if %w(1 breaker codebreaker).include?(@h.role) # human'class really need role var? for future stuff?
      return
    end
=end
  end
end
# TODO: Migrate board's input methods on codebreaker class DONE?CONFIRMING...

Game.new
