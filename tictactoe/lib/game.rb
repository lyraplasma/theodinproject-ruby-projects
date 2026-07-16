require_relative "game/board"
require_relative "game/player"
require "colorize"

def game
  board = Board.new
  print "\t\tEnter Player 1 name: "; p1 = Player.new(Kernel.gets.chomp)
  print "\t\tEnter Player 2 name: "; p2 = Player.new(Kernel.gets.chomp)  

  loop do # game loop
    board.draw
    if board.illegal_move?(p1) then board.ask_again(p1) end
    board.take_player_move(p1, "x")

    break if judge(board, p1, p2)
    board.draw

    p2.take_move
    if board.illegal_move?(p2) then board.ask_again(p2) end
    board.take_player_move(p2, "o")

    break if judge(board, p1, p2)
  end
end

def judge(board, player, another_player)
  if judge_helpr(board.board, "xxx")
    player.add_points
    puts "====================\t#{player.name} win :: Score #{player.score}"    
    board.reset_board
    return true
  elsif judge_helpr(board.board, "ooo")
    another_player.add_points    
    puts "====================\t#{another_player.name} win :: Score #{another_player.score}"    
    board.reset_board    
    # NOTETOSELF: Should resete the game, p1 should take turn 1.
    # Game object will handle?
    return true # temp patch
  end
end

def judge_helpr(b, m)
  pos = ->(x,y,z) { "#{b[x]}#{b[y]}#{b[z]}" } # coord helpr
  if b[0..2].join.eql?(m)||b[3..5].join.eql?(m)||b[6..8].join.eql?(m)||pos.(0,3,6).eql?(m)||pos.(1,4,7).eql?(m)||pos.(2,5,8).eql?(m)||pos.(2,4,8).eql?(m)||pos.(2,4,6).eql?(m)||pos.(0,4,8).eql?(m)
    return true
  else
    return false
  end
end
