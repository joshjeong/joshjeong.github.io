# U2.W4: SOLO CHALLENGE Calculate the Median!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


# 2. Initial Solution

def median(arr)
  arr.sort!
  if (arr.length%2==0)
    # take middle two numbers, add those numbers together, divide by two
    return ((arr[arr.length/2].to_f + (arr[(arr.length/2)-1]).to_f)/2).to_f
  else
    return arr[(arr.length-1)/2]
  end
end


# 3. Refactored Solution



# 4. Reflection 