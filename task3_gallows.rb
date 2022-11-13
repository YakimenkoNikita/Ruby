def main()
    words = [
        ["танк", "ухо", "печь", "лом", "кокос", "стул", "конь", "мячь", "антананариву"],
        ["чепух", "Серебро", "провода", "стакан", "маравей", "голубь", "колобок", "гайка"],
        ["сутенёр", "абдула", "чингисхан", "", "анемона", "чикатила", "гелекоптер"]]                                  
    
    # -----------------
    level = 0   
    have_attempts = 7

    while true do
        case sl_sl = menu() 
        when 1
            start_game_gallows(words[level][rand(words[level].size)], have_attempts)  
            puts "enter something to continue"
            gets

            #-------------
            system "clear"
            system "cls"
        when 2
            level = selected_game_level()
        when 3
            have_attempts = selected_game_attempts()
        when 4
            puts "By-by...."
            break 
        end
    end
end

def copy_array_to_array(curet_progress, secret_word, input_symbol)
    j = 0
    while j < secret_word.length do
        if secret_word[j] == input_symbol
            curet_progress[j] = input_symbol
        end
        j += 1
    end
end

def menu()
    puts "Enter:"
    puts "1 - Start game"
    puts "2 - Select level"
    puts "3 - Select count attempts"
    puts "4 - Exit"
    
    option_selec = 0
    loop do
        print "select option: "
        option_selec = gets.chomp

        if !(option_selec =~ /[[:digit:]]/) || !(option_selec =~ /[1-4]/)
            puts "Invalid, try again" 
            #system "clear"
        else
            return option_selec.to_i
        end
    end
end

def selected_game_level()
    level = 0
    loop do
        puts "Select level: [1 - easy, 2 - medium, 3 - hard]"
        level = gets.chomp

        if !(level =~ /[[:digit:]]/) || !(level =~ /[1-3]/)
            puts "Invalid, try again" 
            #system "clear"
        else
            return level.to_i - 1
        end
    end
end

def selected_game_attempts()
    attempt = 0
    loop do
        puts "Select level: [5-12]"
        attempt = gets.chomp

        if !(attempt =~ /[[:digit:]]/)
            puts "Invalid, try again" 
            next
        end
        attempt = attempt.to_i

        if attempt < 5 || attempt > 12
            puts "Invalid, try again" 
            next
        end

        return attempt.to_i
    end
end

def start_game_gallows(secret_word, have_attempts)
    already_guess = Array.new()
    curet_progress = Array.new(secret_word.length, "_")
    game_result = ""
    symbol_in_guess_word = secret_word.length

    system "clear"
    system "cls"
    print "==================== GAME START ===================="
    while have_attempts != 0 && symbol_in_guess_word != 0 do
        puts "\nWord: #{curet_progress.join(".")}"
        puts "Attemps: #{have_attempts}"

        print "Symbol: "
        input_symbol = gets.chomp.downcase
        if already_guess.include?(input_symbol) 
            puts "You have already guessed this symbol"
            next  
        elsif !(input_symbol =~ /[а-я]/)
            puts "Use Russian-pig language"
        end

        number_matche = secret_word.count(input_symbol)
        if number_matche == 0
            puts "You didn't guess"
            have_attempts -= 1
        else
            puts "You guessed it"
            symbol_in_guess_word -= number_matche
            copy_array_to_array(curet_progress, secret_word, input_symbol)
            already_guess << input_symbol
        end
    end

    puts symbol_in_guess_word == 0 ? "\nCONGRATULATE - YOU WIN (:\n" : "\nSORRY - YOU LOSE ):\n"
    puts "Guess word is #{secret_word}"
    puts "==================== GAME OVER ===================="
end

main()