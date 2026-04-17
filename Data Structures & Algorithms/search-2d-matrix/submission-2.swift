class Solution {

    /*
    we can treat this 2d array like a 1d array of size m * n
        we can convert from 1d coords to 2d coords with
            row = i / rowSize (integer division)
            col = i % rowSize

            [1, 2, 3]
            [4, 5, 6]
            [7, 8, 9]

            5 / 3 = 1
            5 % 3 = 2 -> 6 is at (1, 2)

    from there we can just do binary search
    */


    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }

        let m = matrix.count
        let n = matrix[0].count
        let maxSize = (m * n)

        var l = 0, h = maxSize - 1

        while l <= h {
            let mid = l + ((h - l) / 2)
            let midRow = mid / n, midCol = mid % n

            if matrix[midRow][midCol] < target {
                l = mid + 1
            } else if matrix[midRow][midCol] > target {
                h = mid - 1
            } else {
                return true
            }
        }

        return false
    }
}
