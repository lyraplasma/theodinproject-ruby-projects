p1 = ""
p2 = ""
$p1_history = []
$p2_history = []
$board = ('a'..'i').to_a
=begin
Arrays requires to be global?
TODO: make it obj ltr
=end

def draw
  puts "\t\t<><><><><><><><>\tp1: #{$p1_history}\tp2: #{$p2_history}"
  puts "\t\t#{$board[0]}|#{$board[1]}|#{$board[2]}"
  puts "\t\t#{$board[3]}|#{$board[4]}|#{$board[5]}"
  puts "\t\t#{$board[6]}|#{$board[7]}|#{$board[8]}"
  puts "\t\t<><><><><><><><>"
end
# TODO: Add logs
def game
  while true
    draw
    print "\t\tp1: "
    p1 = gets.chomp

    $p1_history << p1
    $board[$board.index(p1)] = "x" # NOTE: Handle exceptions here!!
    print "\t\tp2: "
    p2 = gets.chomp
=begin
check p's value
if p
- coordinates already occupied?
- p1 and p2 have the same input then p2 will be ask again.
- entered random gilbrish then ask again
- 
=end
    $p2_history << p2  # TODO: search pattern matching thingie
    $board[$board.index(p2)] = "o" # NOTE: Handle execeptions here!!
    case $board[0..2].join
    when "xxx"
      puts "\t\tPlayer 1 wins! yay"
    when "ooo"
      puts "\t\tPlayer 2 wins! yay"
    end
  end
end
game
=begin
Coordinate pattern matching : solution #1
a|b|c    0 1 2
d|e|f    3 4 5
g|h|i    6 7 8

if a b c .. g h i match 3 x's or o's ;;p's win
if a d g .. c f i match ... ^^^^^^^^^^^^^^^^^^
if a e i && c e g match ^^^^^^^^^^^^^^^^^^^^^^
3 hrz checks
3 vert checks
2 crss checks

hence, 0 1 2, 3 4 5, 6 7 8
0 3 6, 1 4 7, 2 5 8
2 4 6, 0 4 8 are winning conditions??

solution #2

...
=end





