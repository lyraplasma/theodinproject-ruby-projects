a = Array.new(12){Array.new(4){"[]"}}
comp_mstrmnd = Array.new(1){Array.new(4){rand(1..6)}}.join
hints = Array.new(12){Array.new(4){"[]"}}

=begin
MMBoard -> board[], hints[], check_slots[]
|>> #display, ...

=end

12.times.with_index do |idx| # whole mstrmnd will handle?
# ^^^^^^^^ main game loop
  check = [] # board.check_slots initalize on board.new?
####################################################################################################
  4.times.with_index do |jdx| # round n
    # TASKDONE: Add board ascii here
    # board.display
    print "\tROUND: #{idx+1}\n\t\tslot#{jdx}1-6: "
    a[idx][jdx] = gets.chomp
  end
####################################################################################################
  4.times.with_index do |i| # board.check_slots(code_maker) # <<<< code_maker ?? module? class?-> using array as intance
    # ^^^^^^^^^^^^^^^^^ code_marker.secret_code: ARRAY
=begin
class CodeMaker -> arr instance -> secret_code rand gen
class CodeBreaker?
=end       
    if a[idx][i] == comp_mstrmnd[i] then check << true else check << false end #=  # board.check_slots << true : false
    #                  ^^^^^^^^^^^^ CodeMaker's instance? ltr
  end
####################################################################################################
  4.times.with_index do |j| # board.check_hints(check_array) # board have hint instance?
    hints[idx][j] = check[j]    # returns hints from board
  end
####################################################################################################
  hints[idx].each {|b| if b then puts "\t| / |" else puts "\t| X |" end} # board.display_hints
####################################################################################################
  if check.join.eql?("truetruetruetrue") # check[] board's instance? or game's?
    puts "\t\tYou win"
    break
  end
####################################################################################################
end
puts "\t\tGame Over!"
=begin
adding enumerable on class
def each &block
  @players.each {|player| block.call(player)}
end
=end
