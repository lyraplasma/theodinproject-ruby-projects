=begin
I cheated, I looked up for hints and solution
TODO: Bisect and Reverse Engineer this later
irb(main):321> min_price, min_day, max_profit, best_days = prices[0],0,0,[0,0]
irb(main):322* prices.each_with_index do |price, day|
irb(main):323*   if price < min_price
irb(main):324*     puts "#{day} round <- the index"
irb(main):325*     puts "Initial min_price and min_day: #{min_price} : #{min_day}"
irb(main):326*     min_price,  min_day = price, day
irb(main):327*     puts "Now min_price and min_day: #{min_price} : #{min_day}"
irb(main):328*   end
irb(main):329*   puts "Past profit: #{profit}"
irb(main):330*   profit = price - min_price
irb(main):331*   puts "Now profit: #{profit}"
irb(main):332*   if profit > max_profit
irb(main):333*     puts "Old max_proft and best_days: #{max_profit} : #{best_days}"
irb(main):334*     max_profit = profit
irb(main):335*     best_days = [min_day, day]
irb(main):336*     puts "New max_proft and best_days: #{max_profit} : #{best_days}"
irb(main):337*   end
irb(main):338> end; best_days
=end
define_method(:stock_picker) do |prices|
  min_p, min_d, max_pft, best_d = prices[0],0,0,[0,0]
  prices.each_with_index do |p, d|
    if p < min_p then min_p, min_d = p, d end
    pft = p - min_p
    if pft > max_pft then max_pft, best_d = pft, [min_d, d] end
  end; best_d
end
