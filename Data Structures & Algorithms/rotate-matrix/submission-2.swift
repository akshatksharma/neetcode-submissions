class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count

        // transpose
        for row in 0..<n {
            for col in row+1..<n {
                (matrix[row][col], matrix[col][row]) = (matrix[col][row], matrix[row][col])
            }
        }

        // reverse each row
        for row in 0..<n {
            for col in 0..<(n / 2) {
                let lastIdx = n-1
                (matrix[row][col], matrix[row][lastIdx-col]) = (matrix[row][lastIdx-col], matrix[row][col])
            }
        }
    }
}

/*
0,0 -> 0,2

1 2 3 
4 5 6
7 8 9

reverse each list

3 2 1
6 5 4
9 8 7

flip across transverse

7 4 1
8 5 2
9 6 3


1 2 4 3 
4 5 4 6
7 8 4 9
9 2 3 4


*/