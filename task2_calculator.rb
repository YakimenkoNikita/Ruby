num1 = 0 
num2 = 0
res = 0
op = ""

puts "Введите первое  число:"
read = gets.chomp
if !(read =~ /[[:digit:]]/)
    puts "Нужно ввести число"
    exit(1)
else
    num1 = read.to_i
end

puts "Вветиде второе число:"
read = gets.chomp
if !(read =~ /[[:digit:]]/)
    puts "Нужно ввести число"
    exit(1)
else
    num2 = read.to_i
end

puts "Выберете желаемую операцию [+, -, *, /]:"
op = gets.chomp
    
case op
when '+'
    res = num1 + num2
when '-'
    res = num1 - num2
when '*'
    res = num1 * num2
when '/'
    begin
        res = num1 / num2
    rescue ZeroDivisionError => error
        puts error.message
        puts error.backtrace.inspect
    end
else
    puts "Неверная операция"
    exit(1)
end

puts "Результат: \n#{num1} #{op} #{num2} = #{res}"
