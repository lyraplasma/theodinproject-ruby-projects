class Board
  attr_accessor :board, :hints, :check_slots
  def initialize
    self.board = Array.new(12){Array.new(4){"[]"}}
    self.hints = Array.new(12){Array.new(4){"()"}}
    @check_slots = []
  end
  def clear_checked_slots
    self.check_slots = []
  end
  def add_number_slot(round) # codebreaker's 
    4.times.each_with_index do |slot|
      self.display
      print "\t\tROUND #{round+1}:\n\t\tSLOT##{slot+1} (1-6): "
      while self.board[round][slot] = Kernel.gets.chomp
        print "\t\t[WARN] Enter 1-6: "
        break if self.board[round][slot].to_i.between?(1,6)
      end
    end
  end
  def match_secret_code(round, secret_code)
    4.times.with_index do |slot|
      if self.board[round][slot] == secret_code[slot]
      # [/][X][ ]
      # ^^^^^^^^ Correct place, Incorrect Place, Not in Secret code              
        self.check_slots << "c"
      else
        if self.board[r].include?(secret_code.split(""))
          self.check_slots << "w"
        end
        self.check_slots << "[]"
      end
    end
  end  
  def display_hints(round)
    4.times.with_index do |slot|
      self.hints[round][slot] = self.check_slots[slot]
    end
    puts "=============================="
    self.hints[round].each do |h|
      if h.eql?("c")
        puts "\t| / |"
      elsif h.eql?("w") # wrong_place
        puts "\t| X |"
      else
        puts "\t|[ ]|"
      end
    end
    puts "=============================="    
  end
  def win?
    self.check_slots.join.eql?("true"*4)
  end
  def display
    # TODO: rfctr ltr
    # 0:1234
    b = self.board
    puts "\t____________________________________________"
    puts "\t| [#{b[11][0]}][#{b[10][0]}][#{b[9][0]}][#{b[8][0]}][#{b[7][0]}][#{b[6][0]}][#{b[5][0]}][#{b[4][0]}][#{b[3][0]}][#{b[2][0]}][#{b[1][0]}][#{b[0][0]}] |"
    puts "\t| [#{b[11][1]}][#{b[10][1]}][#{b[9][1]}][#{b[8][1]}][#{b[7][1]}][#{b[6][1]}][#{b[5][1]}][#{b[4][1]}][#{b[3][1]}][#{b[2][1]}][#{b[1][1]}][#{b[0][1]}] |"
    puts "\t| [#{b[11][2]}][#{b[10][2]}][#{b[9][2]}][#{b[8][2]}][#{b[7][2]}][#{b[6][2]}][#{b[5][2]}][#{b[4][2]}][#{b[3][2]}][#{b[2][2]}][#{b[1][2]}][#{b[0][2]}] |"
    puts "\t| [#{b[11][3]}][#{b[10][3]}][#{b[9][3]}][#{b[8][3]}][#{b[7][3]}][#{b[6][3]}][#{b[5][3]}][#{b[4][3]}][#{b[3][3]}][#{b[2][3]}][#{b[1][3]}][#{b[0][3]}] |"
    puts "\t____________________________________________"
  end
end
=begin
Board will handle hints?

b = MasterMindBoard.new
b.board[0][0] = 1
b.board[0][1] = 3
b.board[0][2] = 6
b.board[0][3] = 2
b.board[2][0] = 1
b.board[3][1] = 3
b.board[9][2] = 6
b.board[11][3] = 2
b.display
=end
