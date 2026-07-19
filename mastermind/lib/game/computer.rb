require_relative "player"

class Computer < Player # TEMPPPP # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< place_numbers of breaker method will be override
# NOTE: Player yields @role
  attr_accessor :secret_code
  def initialize
=begin
def initialize(role)
case (role)
when "maker" then self.generate_secret_code
when "breaker" then self...............................
=end       
    self.generate_secret_code
    # ^^^^^^^^^^^ from CodeMaker's
  end
end
