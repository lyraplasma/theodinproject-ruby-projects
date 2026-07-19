module CodeBreaker
  # args::board's  board, hints, round, board#display
  # Board#display -> CodeBreaker's Human:Computer
  # h = Human.new -> h.add_number_slot? board#board, board#hints board#display

=begin
def place_numbers(round, board#display, board#board)
4.times do |slot| with index
board.display
p ">> "
while board#board[round][slot] = Kernel.gets.chomp; print "warn: "; break if board[r][s].between?1 to 6
end
=end
  def place_numbers(round, board) # TEST IN PROGRESS
    4.times.each_with_index do |slot|
      board.display
      print "\t\tROUND #{round+1}:\n\t\tSLOT##{slot+1} (1-6): "
      while board.board[round][slot] = Kernel.gets.chomp
        print "\t\t[WARNING]: Enter 1-6: "
        break if board.board[round][slot].to_i.between?(1,6)
      end
    end
  end
end
