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

if __FILE__ == $PROGRAM_NAME
  p third_anagram?("elvis", "lives")
end