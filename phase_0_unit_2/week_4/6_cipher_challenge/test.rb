def north_korean_cipher(coded_message)
    decoded_sentence= []
    decoded_sentence2=[]
	input = coded_message.downcase.split("")

 	input.each do |x|
 		if x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*"
	      decoded_sentence << " "
	    elsif x.ord >= 101 && x.ord <= 122
 	        x=x.ord-4
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
		decoded_sentence2 <<y
	end
	  
	decoded_sentence2 = decoded_sentence2.join("")
	if decoded_sentence2.match(/\d+/) 
   		 decoded_sentence2.gsub!(/\d+/) { |num| num.to_i / 100 } 
  	end  
	print decoded_sentence2
end

p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.")
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!")
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.")
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!")
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?")