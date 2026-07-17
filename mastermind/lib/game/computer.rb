class Computer # TEMPPPP
  attr_accessor :secret_code
  def initialize
    self.generate_secret_code
  end
  def generate_secret_code
    self.secret_code = Array.new(1){Array.new(4){rand(1..6)}}.join
  end
end
