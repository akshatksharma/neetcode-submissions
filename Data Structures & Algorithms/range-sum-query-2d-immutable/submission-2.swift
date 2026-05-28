class NumMatrix {
    private var prefixes: [[Int]]

    init(_ matrix: [[Int]]) {
        var prefixes = [[Int]]()

        for row in 0..<matrix.count {
            var prefix = [0]
            for col in 0..<matrix[row].count {
                let val = matrix[row][col]
                prefix.append(prefix[prefix.count-1] + val)
            }
            prefixes.append(prefix)
        }

        self.prefixes = prefixes
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var sum = 0

        for row in row1...row2 {
            let prefix = prefixes[row]
            let rowSum = prefix[col2+1] - prefix[col1]
            sum += rowSum
        }

        return sum
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */


/*
    brute force
        we can iterate within the bounds of the square and compute for each query
            ... could be worst case m*n, where m and n are the rows/cols
    

    optimizations
        shared work between rectangles
        could store the prefix sum for each row on init, then range sums become O(n)

        5 6 3 2 1 

        [0 5 11 14 16 17]

            summing from i=2 to j=4 -> prefix(j+1) - prefix(i)
            summing from i=0 to j=0 -> prefix(1) - prefix(0)

*/