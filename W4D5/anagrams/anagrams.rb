def first_anagram?(str1, str2) # O(n!)
  anagrams = str1.chars.permutation.to_a 
  anagrams.each do |ana|
    return true if ana.join("") == str2
  end
  false
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2) # O(n^2)
  str2_chars = str2.chars 
    str1.chars.each do |char| 
       idx = str2_chars.find_index(char) 
       if !idx.nil?
        str2_chars.delete_at(idx) 
       end
    end
    str2_chars.empty?
end

def fourth_anagram?(str1, str2)
  hash_1 = Hash.new(0)
  str1.each_char do |char|
    hash_1[char] += 1
  end
  
  hash_2 = Hash.new(0)
  str2.each_char do |char|
    hash_2[char] += 1
  end

  hash_1 == hash_2
end

def fifth_anagram?(str1, str2)
  hash = Hash.new(0)
  str1.each_char do |char|
    hash[char] += 1
  end
  str2.each_char do |char|
    hash[char] -= 1
  end
  hash.all? { |_,v| v == 0 }
end

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true

