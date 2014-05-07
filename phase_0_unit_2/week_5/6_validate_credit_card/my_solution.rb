# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode
# define initialize method that takes on one argument cardNumb
# if cardNumb is not equal to 16, raise an error
# define check_card method
# split each digit apart and put them into an array
# create another empty array to put modified numbers into
# iterate through each digit by index
# if index is divisible by 2, double and put into modified array
# else put as is into modified array
# join modified array into a string
# create another array and separate all digits
# iterate through that array and take the sum
# if sum is divisible by 10, return true

# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
class CreditCard
  def initialize(cardNumb)
  	@cardNumb= cardNumb.to_s
    if @cardNumb.length != 16
      raise ArgumentError
  	end
  end

  def check_card
    arr_modified=[]
  	arr=@cardNumb.split("")
    arr.each_with_index {|number, index|
    if index%2 ==0
      arr_modified << number.to_i*2
    else 
      arr_modified << number.to_i
    end
    }
    tempString= Integer arr_modified.join
    tempString2= String tempString
    total= tempString2.split("")
    sum= 0
    total.each {|x|
      sum+=x.to_i
    }
    if sum%10==0
      return true
    else 
      false
    end
  end


end


# 4. Refactored Solution

class CreditCard
  def initialize(cardNumb)
  	@cardNumb= cardNumb.to_s
    if @cardNumb.length != 16
      raise ArgumentError
  	end
  end

  def check_card
    arr_math=[]
  	arr=@cardNumb.split("")
    arr.each_with_index {|number, index|
    if index%2 ==0
      arr_math << number.to_i*2
    else 
      arr_math << number.to_i
    end
    }
    arr_join= Integer arr_math.join
    arr_string= String arr_join
    total= arr_string.split("")
    sum= 0
    total.each {|x|
      sum+=x.to_i
    }
    if sum%10==0
      return true
    else 
      false
    end
  end


end





# DRIVER TESTS GO BELOW THIS LINE
puts card= CreditCard.new(4408043234567893).check_card #false
puts card= CreditCard.new(4563960122001999).check_card #true 
puts card= CreditCard.new(1023984839273748).check_card #false






# 5. Reflection 
# What parts of your strategy worked? What problems did you face?
# The pseudo code really helped to break it down to the steps required
# What questions did you have while coding? What resources did you find to help you answer them?
# I was constantly changing from integers to strings but couldn't find a better way.
# Did you learn any new skills or tricks?
# I learned that .join could not be used on strings
# Which parts of the challenge did you enjoy?
# I always enjoy these hacker/ real life application challenges
# Which parts of the challenge did you find tedious?
# Changing it back and forth from string and integer
