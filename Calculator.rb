#ask the user for two numbers
#ask the user for an operation to perform
#perform the operation on the two numbers
#output the results

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) substract 3) multiply 4) divide")
oprator = Kernel.gets().chomp()

if oprator == '1'
	result = number1.to_i() + number2.to_i()
elsif oprator == '2'
	result = number1.to_i() - number2.to_i()
elsif oprator == '3'
	result = number1.to_i() * number2.to_i()
else
	result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{result}")
