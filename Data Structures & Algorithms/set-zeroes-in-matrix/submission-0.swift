class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count

        // 1st pass, find 0s
        var zeroRows = Set<Int>() // rows that have 0s in them
        var zeroCols = Set<Int>() // cols that have 0s in them

        for row in 0..<m {
            for col in 0..<n {
                if matrix[row][col] == 0 {
                    zeroRows.insert(row)
                    zeroCols.insert(col)
                }
            }
        }


        // 2nd pass set 0s in cols/rows
        for row in 0..<m {
            for col in 0..<n {
                if zeroRows.contains(row) || zeroCols.contains(col) {
                    matrix[row][col] = 0
                }
            }
        }
    }
}