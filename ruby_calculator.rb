require "./module_calculator_validation.rb"
require "./math_operations.rb"

class Calculator
	
	include CalculatorValidation
	include MathOperations
	attr_accessor :first_number, :second_number ,:option

	def initialize(number_1,number_2,option_1)
		@first_number = number_1
		@second_number = number_2
		@option = option_1
	end

	def self.start
		options_list = { "1"=>"add" , "2"=>"subtract" , "3"=>"multiply", "4"=>"divide", "5"=>"exit"}
		loop do 
		puts "\n\n"
		puts "*******---------************---------*******"
		puts "Welcome Ruby Calculator\n\n"
		puts "Select the option to perform:\n\n"
			options_list.each do |key, value|
				puts "\t#{key}-#{value}"
			end
		puts "\n"
		print "Enter your choice :"
		c = gets.chomp
		break if c == "5"
			puts "Enter first number:\n"
			a = gets.chomp
			puts "Enter second number:\n"
			b = gets.chomp				
			calculator = new(a, b, c)
			begin
				puts "-------------------------------------------\n"	
				puts "First number is invalid" if calculator.is_first_number? == false
				puts "Second number is invalid" if calculator.is_second_number? == false
				puts "Enter valid option" if calculator.is_valid_option? == false
				calculator.result(options_list[c]) if calculator.is_valid?
				puts "-------------------------------------------\n"
			rescue
				puts "\nSecond number should not be zero for division"
				puts "-------------------------------------------\n"
			end
		end	
		puts "-------------------------------------------"
		puts "Thanks for using Ruby Calculator"
		puts "-------------------------------------------\n\n"	
	end

end

Calculator.start
