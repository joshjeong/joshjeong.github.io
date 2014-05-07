# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [Phillip Smith].

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]

#Part 1
  def create_word(board, *coords)
    coords.map { |coord| board[coord.first][coord.last]}.join("")
  end

  puts create_word(boggle_board, [2,1], [1,1], [1,2], [0,3])  #=> returns "code"  
  #boggle board tells us which board
  #[row, column]
  puts create_word(boggle_board, [0,1], [0,2], [1,2])  #=> creates what california slang word? RAD

#Part 2
#define row that takes two parameters- source and number
#source will refer to our boggle board
#number is a reference to an index which is a row in this case
#convert to an array
def row(source, number)
    source[number].to_a
end

#Driver
row(boggle_board, 1) # => ["i", "o", "d", "t"]


#Part 3
#define row that takes two parameters- source and numb
#source will refer to our boggle board
#numb will refer to an index in each array within source
def col(source, numb)
	source.map { |x| 
		x[numb]
	}
end

#Driver
col(boggle_board, 1) # => ["r", "o", "c", "a"]

#Reflection
# What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them?
# I had a difficult time with Part 3; I initially couldn't figure out how to select each index of a sub array. I talked it out with my partner 
# and we discussed as well as researched.
# What concepts are you having trouble with, or did you just figure something out? If so, what? Did you learn any new skills or tricks?
# .map is something I want to utilize more often and kind of have a better grasp on it.
# How confident are you with each of the Learning Competencies?
# Like a 7
# Which parts of the challenge did you enjoy?
# Treating an array as a board
# Which parts of the challenge did you find tedious?
# None
