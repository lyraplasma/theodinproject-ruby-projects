module CodeMaker
  @secret_code = []
  def generate_secret_code
    @secret_code = Array.new(1){Array.new(4){rand(1..6)}}.join
  end
  def ask_secret_code
    4.times.each_with_index do |slot|
      print "\t\tEnter #{slot+1} slot: "
      while @secret_code[slot] = Kernel.gets.chomp
        begin
          break if @secret_code[slot].to_i.between?(1, 6)
        rescue => e
          puts e
        end
      end
    end
  end
end

