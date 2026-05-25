class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty, !matrix[0].isEmpty else { return [] }
        
        var ans = [Int]()
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        
        while top <= bottom && left <= right {
            // 1. Move Right: (top row)
            // Use stride or check to ensure range is valid
            for col in left...right {
                ans.append(matrix[top][col])
            }
            top += 1
            
            // 2. Move Down: (right column)
            if top <= bottom {
                for row in top...bottom {
                    ans.append(matrix[row][right])
                }
                right -= 1
            }
            
            // 3. Move Left: (bottom row)
            if top <= bottom {
                for col in stride(from: right, through: left, by: -1) {
                    ans.append(matrix[bottom][col])
                }
                bottom -= 1
            }
            
            // 4. Move Up: (left column)
            if left <= right {
                for row in stride(from: bottom, through: top, by: -1) {
                    ans.append(matrix[row][left])
                }
                left += 1
            }
        }
        
        return ans
    }
}