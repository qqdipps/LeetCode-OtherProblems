=begin
A self-dividing number is a number that is divisible by every 
digit it contains.

For example, 128 is a self-dividing number because 128 % 1 == 0, 
128 % 2 == 0, and 128 % 8 == 0.

Also, a self-dividing number is not allowed to contain the digit zero.

Given a lower and upper number bound, output a list of every 
possible self dividing number, including the bounds if possible.

Example 1:
Input: 
left = 1, right = 22
Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
Note:

The boundaries of each input argument are 1 <= left <= right <= 10000.
=end

# @param {Integer} left
# @param {Integer} right
# @return {Integer[]}
def self_dividing_numbers(left, right)
   	range = [*left .. right]
   	self_divide_nums = []
   	range.each do |num|
   		num_str = num.to_s
   		counter = 0
   		num_str.each_char do |num_part|
   			if num_part == "0"
   				break
   			elsif num % num_part.to_i == 0
   				counter += 1 
   			end
   			self_divide_nums << num if counter == num_str.length
   		end
   	end
 	self_divide_nums
end

def self_dividing_numbers_better(left, right)
   	[*left .. right].select {|num| is_self_dividing?(num)}	 	
end

def is_self_dividing?(num)
	num.to_s.each_char.all? {|num_part| num_part != "0" && num % num_part.to_i == 0}
end


left =  1
right = 16

p self_dividing_numbers_better(left, right)