class Array
    def my_uniq
        new_arr = []
        self.each do |ele|
            new_arr << ele unless new_arr.include?(ele)
        end
        new_arr
    end

    def two_sum
        pair_indices = []

        target = Hash.new

        self.each_with_index do |ele, idx|
            diff = 0 - ele
            if target.has_key?(diff)
                pair_indices << [target[diff], idx]
            else
                target[ele] = idx
            end
        end
        pair_indices
    end
end

def my_transpose(arr)
    new_arr = []
    (0...arr.length).each do |row_i|
        new_row = []
        (0...arr[row_i].length).each do |col_i|
            new_row << arr[col_i][row_i]
        end
        new_arr << new_row 
    end
    new_arr 
end

def stock_picker(nums)
    return [] if nums.length<2 || nums.all?{|ele| nums[0] == ele} || nums.sort.reverse == nums
    hash = Hash.new(){ |h,k| h[k] = Array.new()} # key: price change, values: pair of days 
    nums.each_with_index do |ele, i|
        (0...nums.length).each do |j|
            if j>i  
                hash[nums[j]-ele] << [i, j]
            end
        end
    end
    sorted_hash = hash.sort # 2d array, [[key, value],[key, value]]
    most_profit = sorted_hash.last[0] # (number) the most profit
    most_profitable = sorted_hash.last[1] # (array) pairs of days
    greatest_profit_per_day = 0
    greatest_profit_pair = []
    if most_profitable.length > 1
        most_profitable.each do |pair|
            d1, d2 = pair 
            time = d2 - d1
            diff = most_profit / time 
            if diff > greatest_profit_per_day
                greatest_profit_per_day = diff
                greatest_profit_pair = [pair]
            elsif diff == greatest_profit_per_day
                greatest_profit_pair << pair
            end
        end
        return greatest_profit_pair
    elsif most_profitable.length == 1
        return most_profitable
    end
    
        # return sorted_hash.last[0] > 0 ? 
    #  sorted_hash.last[1].inject {|acc, ele| acc = ele if ele[1] - ele[0] < acc[1] - acc[0] } : 
    #  []
end