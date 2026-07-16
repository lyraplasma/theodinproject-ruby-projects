class Board
  attr_accessor :board
  def initialize # used
    @board = ('a'..'i').to_a
  end
  def reset_board
    @board = ('a'..'i').to_a
  end
  def draw # used
    puts "\t\t==================================="
    puts "\t\t\t#{@board[0]}|#{@board[1]}|#{@board[2]}"
    puts "\t\t\t#{@board[3]}|#{@board[4]}|#{@board[5]}\t\t <<<<<< Use Notation!"
    puts "\t\t\t#{@board[6]}|#{@board[7]}|#{@board[8]}"    
    puts "\t\t==================================="    
  end
  def take_player_move(player, m)
    self.board[self.board.find_index(player.player_move)] = m
  end
  def illegal_move?(player)
    self.board.find_index(player.player_move) == nil
  end
  def ask_again(player) # TASK: add player init :: name
    # WARN: dirty patch
    loop do
      print "\t\t#{player.name}: "
      player.player_move = gets.chomp
      if self.board.find_index(player.player_move).is_a? Numeric
        break
      else
        puts "====================\t\t I l l e g a l  m o v e .  ===================="
      end
    end
  end
end

#board = Board.new
#puts board.board.find_index("a")
#puts board.board.find_index("a").is_a? Numeric
=begin
NOTETOSELF: Function to destroy the current game? then spawn a new board?
=end
