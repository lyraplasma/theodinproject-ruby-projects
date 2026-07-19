module CodeMaker
  @secret_code ||= []
  def generate_secret_code
    @secret_code = Array.new(1){Array.new(4){rand(1..6)}}.join
  end
end
