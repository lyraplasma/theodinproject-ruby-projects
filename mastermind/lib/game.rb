require_relative "game/computer"
require_relative "game/board"

mbrd = Board.new
# ^^^ board, hints, check_slots === []
cdemkr = Computer.new
12.times.with_index do |idx|
  mbrd.clear_checked_slots # @check_slots = []
=begin
  4.times.with_index do |jdx| # mbrd.add_number_slot(idx)
    mbrd.display
#    puts cdemkr.secret_code #DEBUG:TEMP
    print "\tROUND: #{idx+1}\n\t\tslot#{jdx}1-6: "
    mbrd.board[idx][jdx] = Kernel.gets.chomp # board[][] ????
    puts "\t\t\tCurrent input: #{mbrd.board[idx][jdx]}"
  end
=end
  mbrd.add_number_slot(idx) # idx == n rounds
  4.times.with_index do |i|
    if mbrd.board[idx][i] == cdemkr.secret_code[i] # cause: = ???? asignment at if statement? YES
      mbrd.check_slots << true
      puts mbrd.check_slots
    else
      mbrd.check_slots << false
      puts mbrd.check_slots
    end
  end
  4.times.with_index do |j|
    mbrd.hints[idx][j] = mbrd.check_slots[j]
  end
  mbrd.hints[idx].each{|b| if b then puts "\t| / |" else puts "\t| X |" end}
  puts "check_slots #{mbrd.check_slots.join}"
  if mbrd.check_slots.join.eql?("truetruetruetrue")
    puts "\t\tYou win"
    break
  end
end
puts "\t\tG a m e   o v e r !"
