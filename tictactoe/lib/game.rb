require_relative "game/board"
require_relative "game/player"
require "colorize"

#class Game
  # game_start, judge_hlpr, judge, game_reset::main will handle loop?
  # instance @p1, @p2, @board?
#  attr_accessor :p1, :p2, :board
#end
def game
  board = Board.new
  p1, p2 = Player.new("player_1"), Player.new("player_2") # TODO: add Kernel.gets at startup ltr
  # ^^^^^ should be instance var of plyr class?
  # p1 = Player.new; p2 = Player.new
  # ^^^^^^^^^^^^ sample ------------------^^^^
  # then p1's method, p1.move? <<< instance var?
  loop do # game loop
    board.draw
=begin
    # p1.take_move("player_1")?
    ###############################
    loop do # add guard p1 = "x" :: p2 = "o" DONE # TODO: refctr latr :: Add helper func...
      print "\t\tp1: ".colorize(:green)
      p1.player_move = gets.chomp
      # player_1.player_move = gets.chomp
      break if /[a-i]/.match?(p1.player_move) # <<< player_1.pm
    end
    ###############################      ^^^^ p1.take_move mthd
=end
    p1.take_move
# ^^^^^^^^ temp
    if board.illegal_move?(p1) then board.ask_again(p1) end
    board.board[board.board.find_index(p1.player_move)] = "x" #################### TEMP
=begin
    if board.board.find_index(p1.player_move) == nil # <<< player_1.pm
      loop do
        print "\t\tp1: ".colorize(:red)
        p1.player_move = gets.chomp
        if board.board.find_index(p1.player_move).is_a? Numeric
          break
        else
          puts "\t\t====================\t I l l e g a l   m o v e .".colorize(:red)
        end
      end
    end
    board.board[board.board.find_index(p1.player_move)] = "x"
=end
    judge(board)
    board.draw
    ############################### p2's turn
=begin
    loop do
      print "\t\tp2: "; p2.player_move = gets.chomp
      break if /[a-i]/.match?(p2.player_move)
    end
=end
    p2.take_move
    if board.illegal_move?(p2) then board.ask_again(p2) end
    board.board[board.board.find_index(p2.player_move)] = "o" #################### TEMP    
=begin    
    if board.board.find_index(p2.player_move) == nil # ^^^^^^^ TODO: add own methd ltr
      loop do
        print "\t\tp2: "
        p2.player_move = gets.chomp
        if board.board.find_index(p2.player_move).is_a? Numeric
          break
        else
          puts "\t\t!!!!!!!!!!!!!!!!!!!! I l l e g a l   m o v e ."
        end
      end
    end
    #    board.board[board.board.find_index(p2.player_move)] = "o" # DONE::NOTETOSELF: write board's mthd for this
    #    ^^^^^^^^^^^^^^^^ Added on Board#validate_player_move
=end
    judge(board)
  end
end

def judge(board)
  o,x = "ooo", "xxx"
  p1_score, p2_score = 0,0
  # refctr latr
  if judge_helpr(board.board, x)
    puts "Player 1 win"
    board.reset_board
  elsif judge_helpr(board.board, o)
    puts "Player 2 win"
    board.reset_board    
    # NOTETOSELF: Should resete the game, p1 should take turn 1.
    # Game object will handle?
  end
end

# SET: to protected? || private?
def judge_helpr(b, m)
  pos = ->(x,y,z) { "#{b[x]}#{b[y]}#{b[z]}" } # coord helpr
  if b[0..2].join.eql?(m)||b[3..5].join.eql?(m)||b[6..8].join.eql?(m)||pos.(0,3,6).eql?(m)||pos.(1,4,7).eql?(m)||pos.(2,5,8).eql?(m)||pos.(2,4,8).eql?(m)||pos.(2,4,6).eql?(m)||pos.(0,4,8).eql?(m)
    return true
  else
    return false
  end
end
