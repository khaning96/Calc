class Calculator
	def Evaluate (math)
		#Parentheses
		if math =~ /\((\d+[+\-\*\/\^]\d+)\)/
			#Recursion time
			math.gsub!(/\(\d+[+\-\*\/\^]\d+\)/, Evaluate($1))
			
		end
		#Exponents
		if math =~ /(([0-9]*\.?[0-9]*)\^([0-9]*\.?[0-9]*))/
			math.gsub!(/(([0-9]*\.?[0-9]*)\^([0-9]*\.?[0-9]*))/, ($2.to_f**$3.to_f).to_s)
			
		end
		#Multiplication
		if math =~ /([0-9]*\.?[0-9]*)\*([0-9]*\.?[0-9]*)/
			math.gsub!(/([0-9]*\.?[0-9]*)\*([0-9]*\.?[0-9]*)/, ($1.to_f*$2.to_f).to_s)
			puts $1
			puts $2
		end
		#Division
		if math =~ /((\d+)\/(\d+))/
			math.gsub!(/((\d+)\/(\d+))/, ($2.to_f/$3.to_f).to_s)

		end
		#Addition
		if math =~ /((\d+)\+(\d+))/
			math.gsub!(/((\d+)\+(\d+))/, ($2.to_f+$3.to_f).to_s)
		end
		#Subtraction
		if math =~ /((\d+)\-(\d+))/
			math.gsub!(/((\d+)\-(\d+))/, ($2.to_f-$3.to_f).to_s)
			
		end
		
		
		#Stop the recursion
		if math !~ /[+\-\*\/\^]/
			return math
		end
		
		
		#Final Step
		Evaluate(math)
	end

end


puts "Enter your equation below:"
equation = gets
Mathematica = Calculator.new
puts Mathematica.Evaluate(equation) 

while equation.upcase != "STOP"
	puts "Enter your equation or type STOP to exit:"
	equation = gets.chomp
	puts Mathematica.Evaluate(equation)
end
	