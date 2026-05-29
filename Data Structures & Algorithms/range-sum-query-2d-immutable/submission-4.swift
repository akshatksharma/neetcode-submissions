class NumMatrix {
    private var prefixes: [[Int]] // every i,j value is the sum of the rectangle from 0,0 to i-1,j-1

    init(_ matrix: [[Int]]) {
        /*
            for a given i,j the prefix sum is calculated like
                prefix[i][j] = prefix[i-1][j] + prefix[i][j-1] - prefix[i-1][j-1] + matrix[i-1][j-1]
        */
        var prefixes = Array(repeating: Array(repeating: 0, count: matrix[0].count + 1), count: matrix.count + 1)
        for i in 1..<prefixes.count {
            for j in 1..<prefixes[i].count {
                prefixes[i][j] = prefixes[i-1][j] + prefixes[i][j-1] - prefixes[i-1][j-1] + matrix[i-1][j-1]
            }
        }

        self.prefixes = prefixes
    }

    /*
    row1, col1
    row2, col2

    area = prefix(row2+1, col2+1) - ( prefix(row1, col2+1) + prefix(row2+1, col1)) + prefix(row1,col1)

    */
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let sum = prefixes[row2+1][col2+1] - prefixes[row1][col2+1] - prefixes[row2+1][col1] + prefixes[row1][col1]
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