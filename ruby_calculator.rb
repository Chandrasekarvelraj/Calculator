module CalculatorValidation
	
	def is_valid_option?
		self.option.match(/["1","2","3","4"]/) == nil ? false : true
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

class Calculator
	
	include CalculatorValidation
	attr_accessor :first_number, :second_number ,:option

	def initialize(number_1,number_2,option_1)
		@first_number = number_1
		@second_number = number_2
		@option = option_1
	end

	def self.start
		options_list = { "1"=>"add" , "2"=>"subtract" , "3"=>"multiply", "4"=>"divide" }
		puts "\n\n"
		puts "*******---------************---------*******"
		puts "Welcome Ruby Calculator\n\n"
		puts "Enter first number:\n"
		a = gets.chomp
		puts "Enter second number:\n"
		b = gets.chomp
		puts "Select the option to perform:\n\n"
			options_list.each do |key, value|
				puts "\t#{key}-#{value}"
			end
		puts "\n"
		print "Enter your choice :"
		c = gets.chomp
		calculator = new(a, b, c)
			begin
				puts "-------------------------------------------\n"	
				puts "First number is invalid" if calculator.is_first_number? == false
				puts "Second number is invalid" if calculator.is_second_number? == false
				puts "Enter valid option" if calculator.is_valid_option? == false
				calculator.result(options_list[c]) if calculator.is_valid?
				puts "-------------------------------------------\n"			
			rescue
				puts "Second number should not be zero for division"
				puts "-------------------------------------------\n"
			end
				
	end
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

Calculator.start
