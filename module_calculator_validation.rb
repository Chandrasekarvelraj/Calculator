module CalculatorValidation
	
	def is_valid_option?
		self.option.match(/["1","2","3","4","5"]/) == nil ? false : true
	end 
	def is_first_number?
		true if Float(self.first_number) rescue false
	end
	def is_second_number?
		true if Float(self.second_number) rescue false
	end
	def is_valid?
		is_valid_option? && is_first_number? && is_second_number?
	end
end
