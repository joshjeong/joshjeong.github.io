def total(numbers)
  sum=0
  numbers.each {|x| 
    sum+= x   
  }
 return sum
end

def sentence_maker(words)
	finalSentence= 0
	words.each {|x|
	if x==0
		words[0].capitalize
	elsif words.length+1== x
		words[x]+"."
	else
	end
	}
end


print total([1,2,3])      # => 6
print sentence_maker(["i", "want", "to", "go", "to", "the", "movies"])

for num in 1...10
  puts num
end

for num in 1...10
  puts num
end

counter = 1
until counter > 10
  puts counter
    counter+=1  
end