module MathOperations	
	def result(method_name)
		print "\tResult :"
		puts send(method_name)
	end
	def add
		first_number.to_i + second_number.to_i
	end

	def subtract
		first_number.to_i - second_number.to_i
	end

	def multiply
		first_number.to_i * second_number.to_i
	end

	def divide
		first_number.to_i / second_number.to_i
	end

end