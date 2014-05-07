# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode
# def class GuessingGame 
# initializer takes an integer called answer
# def instance var @answer equal to answer
# define method guess that takes guess as input
# if guess is greater than answer, return :high
# if guess is less than answer, return :low
# if guess equals answer, return :correct
# def method solved?
# if guess was equal to answer,return true
# if guess was equal not equal to answer,return false



# 3. Initial Solution

class GuessingGame
  def initialize(answer)
    @answer= answer
  end

  def guess(guess)
  	@guess=guess
  	unless @guess= @answer
   	  if @guess > @answer
  		return :high
  	  else
  		return :low
  	  end
  	else
  		return :correct
  	end
  end

  def solved?
  	if @guess== @answer
  		return true
  	else
  		return false
  	end
  end
end
  

  # def input
  #   last_guess  = nil
  #   last_result = nil

  #   until game.solved?
  #     unless last_guess.nil?
  #       puts "Oops!  Your last guess (#{last_guess}) was #{last_result}."
  #       puts ""
  #     end

	 #  print "Enter your guess: "
	 #  last_guess  = gets.chomp.to_i
	 #  last_result = game.guess(last_guess)
  #   end

  #   puts "#{last_guess} was correct!"
  # end
# end





# 4. Refactored Solution


  # def guess(guess)
  # 	@guess=guess
  # 	if @guess > @answer
  # 		return :high
  # 	elsif @guess < @answer
  # 		return :low
  # 	else
  # 		return :correct
  # 	end
  # end



# 1. DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection 
