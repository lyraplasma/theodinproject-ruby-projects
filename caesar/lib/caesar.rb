# original list alphabeths
# modified alphabeths with key applied
# guardclause for non-alphabeths
def caesar_cipher(phrase, k = 0)
  alphabeths = ("a".."z").to_a
  keys = alphabeths[k..] + alphabeths[0...k]
  phrase.downcase.split.map do |w|
    w.each_char.map do |chr|
      keys[alphabeths.index(chr)]
    end.join
  end.join(" ").capitalize
end
# CHEATSHEETS:
# 65 <=> 90 is A..Z
# 97 <=> 122 is a..z
#
# TODO: deal that problematic punctations
