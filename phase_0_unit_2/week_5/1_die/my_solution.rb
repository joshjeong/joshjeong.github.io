# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# define class Die
# define initialization that passes one argument sides
# if sides is less than 1, raise an Argument ArgumentError
# set instance variable to argument sides
# define method sides which returns instance variable sides
# define method roll that picks a random number from 1 to instance variable sides


# 3. Initial Solution

class Die
  def initialize(sides)
  	if sides < 1
  		raise ArgumentError
  	end
    @sides= sides
  end
  
  def sides
  	return @sides 
  end
  
  def roll
  	prng= Random.new
  	prng.rand(1..@sides)
  end
end



# 4. Refactored Solution
class Die
  def initialize(sides)
  	if sides < 1
  		raise ArgumentError
  	end
    @sides= sides
  end
  
  def sides
  	return @sides 
  end
  
  def roll
  	(1..@sides).to_a.sample # found a way to select random number with one line
  end						       # it also made the code faster
end





# 1. DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection 
# What parts of your strategy worked? What problems did you face?
# I kept getting one error: ArgumentError and wasn't sure how to pass it. I was unaware
# of raise ArgumentError. 
# What questions did you have while coding? What resources did you find to help you answer them?
# I wanted to find a better way to select a random variable and remembered we used .sample
# in a previous exercise.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# I'm still figuring out the different types of variables
# Did you learn any new skills or tricks?
# raise ArgumentError and instance var are new to me
# How confident are you with each of the Learning Competencies?
# Still not a little iffy on instance var
# Which parts of the challenge did you enjoy?
# Being able to translate my logic to code
# Which parts of the challenge did you find tedious?
# None