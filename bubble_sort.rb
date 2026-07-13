=begin
author: lyraplasma
thanks to wikipedia's readable psuedocode i guess?
irb(main):602> b
=> [0, 2, 2, 3, 4, 78]
irb(main):603> b = [4,3,78,2,0,2]
=> [4, 3, 78, 2, 0, 2]
irb(main):604> n = b.size
irb(main):605* while n >= 1
irb(main):606*   newn = 0
irb(main):607*   for i in (1...n) do
irb(main):608*     if b[i-1] > b[i]
irb(main):609*       b[i-1], b[i] = b[i], b[i-1]
irb(main):610*       newn = i
irb(main):611*     end
irb(main):612*   end
irb(main):613*   n = newn
irb(main):614> end;b
=> [0, 2, 2, 3, 4, 78]
irb(main):615> 
=end
# rubocop: disable Metrics/AbcSize
define_method(:bubble_sort) do |A|
  n = A.size
  while n >= 1
    newn = 0
    for in n (1...n) do
      if b[i-1] > b[i]
        b[i-1], b[i] = b[i], b[i-1]
        newn = i
      end
    end
  n = newn
  end; b
end
# rubocop: disable Metrics/AbcSize
