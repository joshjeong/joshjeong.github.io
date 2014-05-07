# U2.W4: Calculate a letter grade!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

# def get_grade method with single argument of an array of scores
# set sum to zero
# iterate through each score and add to sum
# find average of all scores and assign it a var
# create letter grade conditions

# 2. Initial Solution


def get_grade(scores)
  sum=0
  scores.each {|x|
    sum+=x
	}
	avg= sum/scores.length
	if (avg>=90)
		return "A"
	elsif (avg>=80)
		return "B"
	elsif (avg>=70)
		return "C"
	elsif (avg>=60)
		return "D"
	else
		return "F"
	end
end


# 3. Refactored Solution



# 4. Reflection 

What parts of your strategy worked? What problems did you face?
After writing the pseudo, the coding was pretty straightforward 
What questions did you have while coding? What resources did you find to help you answer them?
None, I think we did a similar question in the prep course exercises.
What concepts are you having trouble with, or did you just figure something out? If so, what?
NA
Did you learn any new skills or tricks?
NA
How confident are you with each of the Learning Competencies?
Straight chillin
Which parts of the challenge did you enjoy?
The part where I got an A
Which parts of the challenge did you find tedious?
Nah
