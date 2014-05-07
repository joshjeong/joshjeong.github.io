# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [with: Austin Bourdier].

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

# Define total() as a method
# Pass a single argument through total()
# total() takes an array and adds values in array
# Set sum equal to zero
# Use .each to cycle through each value in array
# Set sum equal to previous sum plus value in array
# Return sum
# Pass array 1 with no errors
# Pass array 2 with no errors

# Define sentence_maker() as a method
# Capitalize first word of array
# Iterate through rest the elements in array to print itself and a space before it.
# After the last element in array, print a period at the end.

# 2. Initial Solution

def total(numbers)
  sum=0
  numbers.each { |x|
    sum+=x
    }
    return sum
end


def sentence_maker(words)
  words[0].capitalize!
  count = 0
  last = words.length-1
  words.each { |x|
    print x 
    if count < last
        print " "
    else
        print "."
    end
    count += 1
}
end


# 3. Refactored Solution



# 4. Reflection 
# What parts of your strategy worked? What problems did you face?
# -It was a little tricky figuring out how to add a period at the end of the sentence. Using a conditional statement and 
# a count, it succeeded in passing the rspec.
# What questions did you have while coding? What resources did you find to help you answer them?
# -No resources were used, only trial and error.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# -Feel very comfortable using .each now
# Did you learn any new skills or tricks?
# -First time using count in a .each 
# How confident are you with each of the Learning Competencies?
# -Solid
# Which parts of the challenge did you enjoy?
# -The sentence maker was fun and a good little puzzle
# Which parts of the challenge did you find tedious?
# -None in this challenge
