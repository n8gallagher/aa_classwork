require "byebug"

# def my_min(array) # Phase One O(n^2)
#   smalls = array.first
#   (0...array.length).each do |i| # n
#     (i+1...array.length).each do |j| # n
#         smalls = array[j]  if array[i] > array[j] && smalls > array[j]
#     end
#   end
#   smalls
# end


# def my_min(array) # Phase Two O(n)
#   min = array[0]
#   (1...array.length).each do |i|
#     min = array[i] if array[i] < min
#   end
#   min
# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# def largest_contiguous_subsum(arr) # Phase 1 O(n^3)
#     subs = []
#     (0...arr.length).each do |i| #n
#         (i...arr.length).each do |j| #n
#            subs << arr[i..j].sum #2n (slice is n, sum is n)
#         end
#     end
#     subs.max # n^2
# end

# def largest_contiguous_subsum(arr) # Phase 2 O(n)
#   largest_sum = 0
#   current_sum = 0
# #   debugger
#   if arr.all? { |ele| ele < 0 } #if all are negative we can just return the max of the array
#     largest_sum = nil
#     current_sum = 0
#     (0...arr.length).each do |i|
#       current_sum += arr[i]
#       if largest_sum.nil? || current_sum > largest_sum
#         largest_sum = current_sum
#       elsif current_sum < largest_sum && arr[i] > largest_sum
#         largest_sum = arr[i]
#       end
#     end
#     return largest_sum
#   else
#     (0...arr.length).each do |i|
#       current_sum += arr[i]
#       if current_sum > largest_sum
#         largest_sum = current_sum 
#       elsif current_sum < 0 
#         current_sum = 0  
#       end
#     end
#   end
#   largest_sum
# end

#alternate solutuion for lcs

def lcc(arr)
  largest_sum = arr.first
  current_sum = arr.first
  (1...arr.length).each do |i|
    current_sum = 0 if current_sum < 0
    current_sum += arr[i]
    largest_sum = current_sum if current_sum > largest_sum
  end
  largest_sum
end

# possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7

# list = [5, 3, -7]
# p largest_contiguous_subsum(list)

# list2 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list2)

list3 = [-5, -1, -3]
p largest_contiguous_subsum(list3) # => -1 (from [-1])
