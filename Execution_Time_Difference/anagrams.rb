def first_anagram?(str1,str2)
  chars = str1.chars
  perms = chars.permutation(str1.length)

  words = perms.map { |perm| perm.join('') }
  words.include?(str2)
end

def second_anagram(str1, str2)
end 

if __FILE__ == $PROGRAM_NAME
  p first_anagram?("elvis", "lives")
end