input_s = "In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income."

sep_s = input_s.downcase.split(/[^[[a-zA-Z]'-]]+/)
WORD_COUNT = Hash.new
for word in sep_s do
    if !WORD_COUNT.include?(word)
        WORD_COUNT[word] = sep_s.count(word) 
    end
end

topThreeWord = WORD_COUNT.sort_by {|k, v| v}.to_h.keys.reverse
print topThreeWord[0..2]
