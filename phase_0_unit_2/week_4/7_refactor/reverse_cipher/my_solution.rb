# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself].


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a #create an array of alphabet characters
    cipher = Hash[alphabet.zip(alphabet.rotate(4))]#shift alphabet by four
    spaces = ["@", "#", "$", "%", "^", "&", "*"]#create array called spaces
    
    original_sentence = sentence.downcase#lowercase whole string
    encoded_sentence = []#create empty array 
    original_sentence.each_char do |element|
      #iterate through each character in string
      if cipher.include?(element)
        encoded_sentence << cipher[element]
        #if character is a letter, rotate value by 4
      elsif element == ' '
        encoded_sentence << spaces.sample
        #if it is a space, randomly select an element from spaces array
        #and add to encoded array
      else 
        encoded_sentence << element
        #if none of the above, leave character as is and at to array
      end
     end
    
    return encoded_sentence.join
    #join elements in encoded sent array to create one string
end


# # Questions:
# # 1. What is the .to_a method doing? Creates an array consisting of
# separate alphabet strings.
# # 2. How does the rotate method work? What does it work on? Rotate method 
# is being used on an array. It takes the first value and adds it to the end. 
# # 3. What is `each_char` doing? each_car iterates over each character in 
# the string
# # 4. What does `sample` do? Chooses a random element from array
# # 5. Are there any other methods you want to understand better? 
# # 6. Does this code look better or worse than your refactored solution
# #    of the original cipher code? What's better? What's worse? 
# It looks a lot better. We decided to use .ord which made our code longer.
# # 7. Is this good code? What makes it good? What makes it bad?
# It is a good code because it's very DRY


# 1. DRIVER TESTS GO BELOW THIS LINE
#the symbols or spaces are different
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")





# 5. Reflection 
# What parts of your strategy worked? What problems did you face? 
# Going through each line item in the code was very effective.
# What questions did you have while coding? What resources did you find to help you answer them?
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# Did you learn any new skills or tricks?
# How confident are you with each of the Learning Competencies?
# Which parts of the challenge did you enjoy?
# Which parts of the challenge did you find tedious?

