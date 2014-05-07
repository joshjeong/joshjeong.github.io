# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
            "Annabelle" => 0, "Ditto" => 3}

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
     source.each do |x|
        if x.to_s.include? thing_to_find
            puts x
        end
    end
end

def my_hash_finding_method(source, thing_to_find)
      source.each do |k,v|
        if v.to_s.include?(thing_to_find.to_s)
            puts k
        end
    end
end

#.each- iterates through each element in array
#.to_s- converts value to a string
#.include?()- checks if value is included in array

# Person 2
def my_array_modification_method(source, thing_to_modify)
    source.each do |x|
        if x.is_a? Integer
    source.each do |x,y|
          numb = source.index(x)
          source[numb] += thing_to_modify
        end
    end
    return source
end

def my_hash_modification_method(source, thing_to_modify) 
        if y.is_a? Integer
            numb= source.index(y)
            source[numb]+=thing_to_modify
        end
    end
    return source
end

# Identify and describe the ruby method you implemented. 
# I implemented two different methods for my part of the project.
# 1. The first method I implemented was the .is_a? method. This checks to see if the
# object being tested (directly before the .is_a?) is a member of the class directly after it.
# In this case, I was checking to see if the items in the array were integers before modifying them.
# 2. The second method I implemented was .index(). This method finds the index of a value already in 


# Person 3
 def my_array_sorting_method(source)
 +      temp_arr = []
 +      arr.each do |x|
 +          temp_arr.push(x.to_s)
 +      end
 +      temp_arr.sort
 +  end
 +  
 +  def my_hash_sorting_method(source)
 +      temp_arr = []
 +      
 +      # first method.. dont quite understand this. got it from rubydocs (http://ruby-doc.org/core-1.8.6/Hash.html#method-i-sort)
 +      #arr.sort do |k,v| 
 +      #    k[1] <=> v[1]
 +      #end
 +      
 +      arr.each do |k,v|
 +          temp_arr.push([v,k])
 +      end
 +      temp_arr = temp_arr.sort
 +      temp_arr.each do |v|
 +          temp = v[0]
 +          v[0] = v[1]
 +          v[1] = temp
 +      end
 +      temp_arr
 +  end
  
  # Identify and describe the ruby method you implemented. 
 -# 
  #
 +# For this problem, I used two special ruby methods: to_s & sort.
 +# I initially created a different method for the my_hash_sorting_method.. but I don't quite understand how it works! So I made another one that is less "magical". If someone can explain how that method works I will be happy to listen!
 +# By the way, it seems the driver code is failing for the functions I made.. but it looks like this is because the array has been modified.
 +# Can someone please confirm this? Or did I read the instructions wrong?
  #
 +# I will revisit this problem tomorrow morning with a fresh mind to confirm.
 
 # Person 4 [Did not receive from group member]
def my_array_deletion_method(source, thing_to_delete)
  #Your code here!
end

def my_hash_deletion_method(source, thing_to_delete)
  #Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#



################## DRIVER CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.

p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "I", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]] 
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "I", "only", 3 ]
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}

# Reflect!
# What parts of your strategy worked? What problems did you face?
#- I had to use google to find a method that would search for a specific letter
# What questions did you have while coding? What resources did you find to help you answer them?
#- I used multiple sites to learn .include?()
# What concepts are you having trouble with, or did you just figure something out? If so, what?
#- None after reading up on .include
# Did you learn any new skills or tricks?
#- .include?()
# How confident are you with each of the Learning Competencies?
#- Muy bueno
# Which parts of the challenge did you enjoy?
#- Learning a new finding method
# Which parts of the challenge did you find tedious?
#- None
