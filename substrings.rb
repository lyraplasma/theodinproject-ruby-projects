=begin
author: lyraplasma
description:
uhh as of 2026年  7月  8日 水曜日 16:11:46 JST
I learned about regex stuff. it was fun!
=end

def substrings(target_str, wordlists)
  wordlists.reduce(Hash.new(0)) do |acc,v|
    if Regexp.new(v).match?(target_str)
      acc[v] += 1
    end; acc
  end
end

=begin
That Regex.new is truly handy
I can't just insert the name of variable c on two slash
if c's value is "42"
and when I tried this /c/
guess what? it's c :>

seems it works on "below" keyword but it won't work on "go"?

substrings("below", dictionary)
=> {"below" => 1, "low" => 1}
=end
