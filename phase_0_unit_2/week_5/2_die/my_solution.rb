# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# define class Die
# define initialize that passes one argument labels
# if length of labels is less than 1, raise an argument ArgumentError
# otherwise, set instance variable @labels to labels
# define method sides
# it will return the number of labels
# define method roll
# it will choose a random element



# 3. Initial Solution

class Die
  def initialize(labels)
  	if labels.length<1
  		raise ArgumentError
  	end
  	@labels= labels
  end

  def sides
  	return @labels.length
  end

  def roll
  	(@labels).to_a.sample
  end
end



# 4. Refactored Solution

class Die
  def initialize(labels)
  	if labels.length<1
  		raise ArgumentError
  	end
  	@labels= labels
  end

  def sides
  	return @labels.length
  end

  def roll
  	(@labels).to_a.sample #realized converting to an array was uneccesary
  end
end





# 1. DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection 
# This challenge was very similar to the previous one. I feel a little more comfortable
# dealing with instance variables. It is refreshing not having too much trouble knowing how 
# to alter the code to fit a slightly different situation. 
