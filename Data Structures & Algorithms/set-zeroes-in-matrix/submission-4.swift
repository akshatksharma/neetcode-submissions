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
                        shouldFirstRowBeZero = true // we need an extra var bc 0,0 is taken by the row data
                    } else {
                        matrix[row][0] = 0
                    }
                }
            }
        }


        // 2nd passes

        // set 0s on inner rows
        for row in 1..<m {
            for col in 1..<n {
                if matrix[0][col] == 0 || matrix[row][0] == 0 {
                    matrix[row][col] = 0
                }
            }
        }

        // set first row 0s
        if matrix[0][0] == 0 {
            for row in 0..<m {
                matrix[row][0] = 0
            }
        }
        
        // set first col 0s
        if shouldFirstRowBeZero {
            for col in 0..<n {
                matrix[0][col] = 0
            }
        }
    }
}