def insert? (m, r, c, n)

    for i in 0..8 do 
        if m[r][i] == n
            return false
        end
    end

    for i in 0..8 do
        if m[i][c] == n
            return false
        end
    end

    x33_i = r - r % 3
    x33_j = c - c % 3
    for i in 0..2 do
        for j in 0..2 do
            if (m[i + x33_i][j + x33_j] == n)
                return false
            end
        end
    end

    true
end

def CalculateSudoky(m, r, c)

    if (r == 8 && c == 9)
        return true
    end

    if c == 9
        c = 0
        r += 1
    end

    if (m[r][c] != 0)
        return CalculateSudoky(m, r, c + 1)
    end

    for n in 1..9 do
        if (insert?(m, r, c, n))
            m[r][c] = n

            if (CalculateSudoky(m, r, c + 1))
                return true
            end
        end

        m[r][c] = 0
    end

    false
end

#----------------------------
sudoku = [[5,3,0,0,7,0,0,0,0],
          [6,0,0,1,9,5,0,0,0],
          [0,9,8,0,0,0,0,6,0],
          [8,0,0,0,6,0,0,0,3],
          [4,0,0,8,0,3,0,0,1],
          [7,0,0,0,2,0,0,0,6],
          [0,6,0,0,0,0,2,8,0],
          [0,0,0,4,1,9,0,0,5],
          [0,0,0,0,8,0,0,7,9]]

CalculateSudoky(sudoku, 0, 0)

for i in 0..8 do
    for j in 0..8 do
        print "#{sudoku[i][j]} "
    end
    puts 
end