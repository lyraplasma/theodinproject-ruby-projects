X = "xxx"
O = "ooo"
$p1_history = []
$p2_history = []
$board = ('a'..'i').to_a
=begin
Arrays requires to be global?
TODO: make it obj ltr
=end
def reset_board
  $board = ('a'..'i').to_a
end
def draw
  puts "\t\t<><><><><><><><>\tp1: #{$p1_history}\tp2: #{$p2_history} #{X}: #{O}"
  puts "\t\t#{$board[0]}|#{$board[1]}|#{$board[2]}"
  puts "\t\t#{$board[3]}|#{$board[4]}|#{$board[5]}"
  puts "\t\t#{$board[6]}|#{$board[7]}|#{$board[8]}"
  puts "\t\t<><><><><><><><>"
end
# TODO: Add logs
def game
  p1,p2 = "",""
  while true
    draw
    loop do
      print "\t\tp1: "
      p1 = gets.chomp
      puts p1
      break if /[a-i]/.match?(p1)
    end
  puts "\t********** p1's #{p1.class}"
  if $board.find_index(p1) == nil # ????
    loop do
      print "\t\tp1: "
      p1 = gets.chomp
      puts ">>>>>>>>>>>>>>>>>>>>\t #{p1}"
      if $board.find_index(p1).is_a? Numeric
        break
      else
        puts "**********\t Illegal move."
      end
    end
  end
  puts ">>>>>>>>>>>>>>>>>>>>\t #{p1}"
  $board[$board.find_index(p1)] = "x"
  $p1_history << p1
  judge
  draw
loop do
      print "\t\tp2: "
      p2 = gets.chomp
break if /[a-i]/.match?(p2)
end
    $p2_history << p2
    # add guardrails here!!!!!!!!!!
    if $board.find_index(p2) == nil
      # temporary dirty patch
      loop do
        print "\t\tp2: "
        p2 = gets.chomp
        puts ">>>>>>>>>>>>>>>>>>>>\t #{p2}"
        if $board.find_index(p2).is_a? Numeric
          break
        else
          puts "\t\t illegal move."
        end
      end
    end
        puts ">>>>>>>>>>>>>>>>>>>>\t #{p2}"
        $board[$board.find_index(p2)] = "o"
        judge
=begin
check p's value
if p
- coordinates already occupied?
- p1 and p2 have the same input then p2 will be ask again.
- entered random gilbrish then ask again
- 
=end
# hence, 0 1 2, 3 4 5, 6 7 8 :: 0 3 6, 1 4 7, 2 5 8 :: 2 4 6, 0 4 8 are winning conditions??
    # TODO: REFACTOR Dirty patch
  end
end
def judge
  p1_score, p2_score = 0,0
    case $board[0..2].join
    when X then puts "\t\tPlayer 1 wins! yay"; p1_score += 1; reset_board
    when O then puts "\t\tPlayer 2 wins! yay"; p2_score += 1; reset_board
    end
    case $board[3..5].join
    when X then puts "\t\tPlayer 1 wins! yay"; p1_score += 1; reset_board
    when O then puts "\t\tPlayer 2 wins! yay"; p2_score += 1; reset_board
    end
    case $board[6..8].join
    when X then puts "p1's"; p1_score +=1; reset_board
    when O then puts "p1's"; p2_score += 1; reset_board
    end
    case "#{$board[0]}#{$board[3]}#{$board[6]}"
    when X then puts "p1"; p1_score += 1; reset_board
    when O then puts "p2"; p2_score += 2; reset_board
    end
    case "#{$board[1]}#{$board[4]}#{$board[7]}"
    when X then puts "p1"; p1_score +=1; reset_board
    when O then puts "p2"; p2_score += 1; reset_board
    end    
    case "#{$board[2]}#{$board[5]}#{$board[8]}"
    when X then puts "p1"; p1_score += 1; reset_board
    when O then puts "p2"; p2_score += 1; reset_board
    end
    case "#{$board[2]}#{$board[4]}#{$board[6]}"
    when X then puts "p1"; p1_score += 1; reset_board
    when O then puts "p2"; p2_score += 1; reset_board
    end
    case "#{$board[0]}#{$board[4]}#{$board[8]}"
    when X then puts "p1"; p1_score += 1; reset_board
    when O then puts "p2"; p2_score += 1; reset_board
    end
    puts "##############################"
    puts "p1: #{p1_score} :: p2: #{p2_score}"
        puts "##############################"
end
# hence, 0 1 2, 3 4 5, 6 7 8 :: 0 3 6, 1 4 7, 2 5 8 :: 2 4 6, 0 4 8 are winning conditions??    
game
=begin
Coordinate pattern matching : solution #1
NOTE: coordpatternmatch seems working (bruteforce?)
a|b|c    0 1 2
d|e|f    3 4 5
g|h|i    6 7 8

if a b c .. g h i match 3 x's or o's ;;p's win
if a d g .. c f i match ... ^^^^^^^^^^^^^^^^^^
if a e i && c e g match ^^^^^^^^^^^^^^^^^^^^^^
3 hrz checks
3 vert checks
2 crss checks

hence, 0 1 2, 3 4 5, 6 7 8 :: 0 3 6, 1 4 7, 2 5 8 :: 2 4 6, 0 4 8 are winning conditions??

solution #2

...
=end
=begin
#grep(/a/) array's
=end
