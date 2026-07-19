require_relative "codemaker"
require_relative "codebreaker"

class Player
  attr_accessor :role
  include CodeMaker, CodeBreaker
end
