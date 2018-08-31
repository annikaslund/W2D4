require 'byebug'
def first_anagram?(str1,str2)
  chars = str1.chars
  perms = chars.permutation(str1.length)

  words = perms.map { |perm| perm.join('') }
  words.include?(str2)
end

def second_anagram?(str1, str2)
  chars = str1.chars 
  chars2 = str2.chars
  
  chars.each do |ch| 
    index = chars2.find_index(ch)
    return false if index == nil 
    chars2.delete_at(index) 
  end 
  chars2.empty?
end 

def third_anagram?(str1, str2)
  chars = str1.chars 
  chars2 = str2.chars 
  
  chars.sort! 
  chars2.sort! 
  
  chars == chars2
end 

def fourth_anagram?(str1, str2)
  count_hash = Hash.new(0)
  # count_hash2 = Hash.new(0)
  
  str1.each_char do |ch| 
    count_hash[ch] += 1 
  end 
  
  str2.each_char do |ch2| 
    count_hash[ch2] -= 1
  end 
  
  count_hash.values.all? {|value| value == 0}
   
end

if __FILE__ == $PROGRAM_NAME
  p fourth_anagram?("elvis", "lives")
end