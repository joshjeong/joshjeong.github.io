# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode

define a class Array
define two methods pad and pad!
they will pass two arguments- number of times, and pad value
it will take the difference between length of array and agrument number
pad value will be added to array x amount of times (the difference)

# 2. Initial Solution


# number= arr.length
# number> arrlength
# my_array=[]

class Array
  def pad!(number, padValue)
  	(number - self.length).times do self.push(padValue) 
  	end
  	replace(self)
  	return(self)
  end
  
  def pad(number, padValue = nil)
    duplicate= self.dup
    (number - self.length).times do duplicate.push(padValue) 
    end
  return duplicate
  end
end



# 3. Refactored Solution
class Array
  def pad!(number, padValue)
  	(number - self.length).times do self.push(padValue) 
  	end
  	replace(self)
  	return(self)
  end
  
  def pad(number, padValue = nil)
    dup.pad!(number, padValue)
  end
end


# # 4. Reflection 
# A lot of research was required for this challenge. I've never used self, dup, or replace.
# I'm still not confident with these methods but it was good being exposed to them. 
