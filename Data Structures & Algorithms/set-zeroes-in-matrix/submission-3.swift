class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count

        var shouldFirstRowBeZero = false

        for row in 0..<m {
            for col in 0..<n {
                if matrix[row][col] == 0 {
                    matrix[0][col] = 0

                    if row == 0 {
                        shouldFirstRowBeZero = true
                    } else {
                        matrix[row][0] = 0
                    }
                }
            }
        }


        // 2nd pass set 0s in cols/rows
        for row in 1..<m {
            for col in 1..<n {
                if matrix[0][col] == 0 || matrix[row][0] == 0 {
                    matrix[row][col] = 0
                }
            }
        }

        if matrix[0][0] == 0 {
            for row in 0..<m {
                matrix[row][0] = 0
            }
        }

        if shouldFirstRowBeZero {
            for col in 0..<n {
                matrix[0][col] = 0
            }
        }
    }
}