# Remove dups: Array has a uniq method that removes duplicates from an array. 
# It returns the unique elements in the order in which they first appeared:
def my_uniq(arr)
    uniq_arr = []
    arr.each do |el|
        uniq_arr << el unless uniq_arr.include?(el)
    end
    uniq_arr
end

# Two sum: Write a new Array#two_sum method that finds all pairs of positions 
# where the elements at thost positions sum to zero
# Ordering matters. We want each of the pairs to be sorted smaller index before bigger index.
# We want the array of pairs to be sorted "dictionary-wise"
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
def two_sum(arr)
    pairs = []
    arr.count.times do |i1|
        (i1 + 1).upto(arr.count - 1) do |i2|
            pairs << [i1, i2] if arr[i1] + arr[i2] == 0
        end
    end
    pairs
end

# My Transpose: Write a method, my_transpose, which will convert 
# between row-oriented and column-oriented representations.
# You may assum square matrices for simplicity's sake
def my_transpose(rows)
    dimension = rows.first.count
    cols = Array.new(dimension) { Array.new(dimension) }
    dimension.times do |i|
        dimension.times do |j|
            cols[j][i] = rows[i][j]
        end
    end
    cols
end

# Stock Picker: Write a method that takes an array of stock prices (prices on days 0, 1, ...)
# and outputs the most profitable pair of days on which to first buy the stock
# and then sell the stock. Remember you can't sell stock before you buy it!

def pick_stocks(prices)
    # can always make zero dollars by not buying/selling
    best_pair = nil
    best_profit = 0
  
    prices.each_index do |buy_date|
      prices.each_index do |sell_date|
        # can't sell before buy
        next if sell_date < buy_date
  
        profit = prices[sell_date] - prices[buy_date]
        if profit > best_profit
          # Choose best days. Greed is good.
          best_pair, best_profit = [buy_date, sell_date], profit
        end
      end
    end
  
    best_pair
  end