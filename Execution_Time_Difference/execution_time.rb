# def my_min(list)
#   list.each_with_index do |el, idx| 
#     return el if list.all? { |el2| el <= el2 }
#   end 
# end 

def my_min(list)
  min = list.first 
  list[1..-1].each { |el| min = el if el < min }
  min
end

# def largest_contiguous_subsum(list) 
#   subs_arrs = [] 
#   (0...list.length).each do |idx| 
#     (idx...list.length).each do |idx2| 
#       subs_arrs << list[idx..idx2]
#     end 
#   end 
#   max = -1000
#   subs_arrs.each do |sub_arr|
#     sum = sub_arr.reduce(:+)
#     max = sum if sum > max
#   end
#   max
# end 

def largest_contiguous_subsum(list)
  max_sum = list.first
  sum = 0

  list.each do |el|
    sum += el 
    max_sum = sum if sum > max_sum 
    sum = 0 if sum < 0 
  end 
  
  max_sum
end


if __FILE__ == $PROGRAM_NAME
  list = [5, 3, -7]
  p largest_contiguous_subsum(list)
end 