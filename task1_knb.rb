def main()
	puts "[1 - clippers, 2 - paper, 3 - stone]"
	not_user = rand(1..3)
	user = gets.to_i
	result = ""

	if user == 1 && not_user == 2
		result << "YOU WIN"
	elsif user == 1 && not_user == 3
		result << "WIN COMPUTER" 
	elsif user == 2 && not_user == 1
		result << "WIN COMPUTER" 
	elsif user == 2 && not_user == 3
		result << "YOU WIN"
	elsif user == 3 && not_user == 1
		result << "YOU WIN"
	elsif user == 3 && not_user == 2
		result << "WIN COMPUTER" 
	else
		result << "DRAW" 
	end

	puts "You : #{digit_kto_text(user)} VS Computer : #{digit_kto_text(not_user)}"
	puts "Result: #{result}"
end

def digit_kto_text(digit_t)

	if digit_t == 1
		return "clippers"
	elsif digit_t == 2
		return "paper"
	elsif digit_t == 3
		return "stone"
	else
		return "error"
	end
end

main()