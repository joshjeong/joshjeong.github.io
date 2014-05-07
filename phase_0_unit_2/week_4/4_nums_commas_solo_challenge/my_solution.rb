# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

# define method separate_comma that passes one argument
# convert argument input to a string
# create condition thresholds for thousands, millions, and billions
# insert comma into the correct spot
# return the number now with comma(s)

# 2. Initial Solution

def separate_comma(input)
  number= input.to_s
  if number.length>9
    number.insert(-3,',')
    number.insert(-6,',')
    number.insert(-9,',') 
  elsif number.length>6
  	number.insert(-3,',')
    number.insert(-6,',')
  elsif number.length>3
  	number.insert(-3,',')
  else
  	return number
end
end



# 3. Refactored Solution
#the commas were in the wrong position
def separate_comma(input)
  number= input.to_s
  if number.length>9
    number.insert(-4,',')
    number.insert(-8,',')
    number.insert(-12,',') 
  elsif number.length>6
  	number.insert(-4,',')
    number.insert(-8,',')
  elsif number.length>3
  	number.insert(-4,',')
  else
  	return number
end
end


# 4. Reflection 
What parts of your strategy worked? What problems did you face?
I had the right initial plan but my commas were a little off
What questions did you have while coding? What resources did you find to help you answer them?
I had to research a method that woiuld insert the comma
What concepts are you having trouble with, or did you just figure something out? If so, what?
I couldn't get the rspec to work- I kept getting an error regarding the describe.
Did you learn any new skills or tricks?
.insert
How confident are you with each of the Learning Competencies?
All good in the hood
Which parts of the challenge did you enjoy?
When I found out my initial solution was really close.
Which parts of the challenge did you find tedious?
None
