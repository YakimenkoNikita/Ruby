OPENING_BRACKETS = {"(" => 0, "{" => 1, "[" => 2}
CLOSING_BRACKETS = {")" => 0, "}" => 1, "]" => 2}

def main()
  puts "Enter string"
  string = gets.chomp

  puts "#{check_valid_brackets(string)}"
end

def check_valid_brackets(string)
  stack  = []
  string.each_char do |ch|
    if OPENING_BRACKETS.include?(ch)
      stack.push(ch)
    else
      OPENING_BRACKETS[stack.last] == CLOSING_BRACKETS[ch] ? stack.pop : (return false)
    end
  end
  return (stack.empty?)
end

main()