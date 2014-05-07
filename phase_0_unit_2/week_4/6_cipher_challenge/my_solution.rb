# U2.W4: Cipher Challenge


# I worked on this challenge with: 
# -Brendan Susens-Jackson



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.



def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes? This is not 
            "g" => "c",   # the best way because it is not DRY. We can create an algorithm since there is a consistent
            "h" => "d",   # pattern.
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # What is #each doing here? Iterates over each element in array
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true? Because a match should be found
    cipher.each_key do |y| # What is #each_key doing here? Iterates over each key in array
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really? If the input is found in the cipher
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here? Since match has been found
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing? If input is any of these symbols, a space is created
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do? Creates an array with elements numbered 1-9
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # What is this looking for? If a character is neither in the alphabet or one of the symbols representing a space, it will remain the same
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. Looking for any number
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
  end  
  return decoded_sentence # What is this returning? Final decoded string
end

# Your Refactored Solution

def north_korean_cipher(coded_message)
    decoded_sentence= []
    decoded_sentence2=[]
    input = coded_message.downcase.split("")
  input.each do |x|
    if x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*"
        decoded_sentence << " "
      elsif x.ord >= 101 && x.ord <= 122
          x= x.ord-4
          decoded_sentence << x
        elsif x.ord >= 97 && x.ord <= 100
            x= x.ord+22
            decoded_sentence << x
        else
          decoded_sentence << x
        end
         
        end    
      decoded_sentence.each do |y|
    y=y.chr
    decoded_sentence2 << y
  end
  decoded_sentence2 = decoded_sentence2.join("")
  if decoded_sentence2.match(/\d+/) 
       decoded_sentence2.gsub!(/\d+/) { |num| num.to_i / 100 } 
    end  
  print decoded_sentence2
end


# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.")
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!")
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.")
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!")
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?")

# Reflection
# What parts of your strategy worked? What problems did you face?
# We wanted to find a way to convert the alphabet to numbers but weren't quite sure how
# What questions did you have while coding? What resources did you find to help you answer them?
# We researched different techniques to make the alphabet numerical.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# Values assigned to characters was a pretty new concept for me
# Did you learn any new skills or tricks?
# .ord, .match, .gsub, .join
# How confident are you with each of the Learning Competencies?
# I still feel like it can be refactored better.
# Which parts of the challenge did you enjoy?
# The whole challenge itself in creating a decoder
# Which parts of the challenge did you find tedious?
# Figuring out how to assing value and shift the alphabet.

 
