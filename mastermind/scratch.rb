a = Array.new(12){Array.new(4){"[]"}}
comp_mstrmnd = Array.new(1){Array.new(4){rand(1..6)}}.join
hints = Array.new(12){Array.new(4){"[]"}}

12.times.with_index do |idx|
  check = []
  4.times.with_index do |jdx|
    print "\tROUND: #{idx+1}\n\t\tslot#{jdx}1-6: "
    a[idx][jdx] = gets.chomp
  end
  4.times.with_index do |i|
    if a[idx][i] == comp_mstrmnd[i] then check << true else check << false end
  end
  4.times.with_index do |j|
    hints[idx][j] = check[j]
  end
  hints[idx].each {|b| if b then puts "\t| / |" else puts "\t| X |" end}
  if check.join.eql?("truetruetruetrue")
    puts "\t\tYou win"
    break
  end
end
puts "\t\tGame Over!"
=begin
adding enumerable on class
def each &block
  @players.each {|player| block.call(player)}
end
=end
