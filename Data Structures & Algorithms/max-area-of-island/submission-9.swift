class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var maxArea = 0

        func dfs(_ row: Int, _ col: Int) -> Int {
            visited[row][col] = true

            var size = 1
            
            // add sizes of all 1 neighbors
            var dirs = [(1,0), (0,1), (-1,0), (0,-1)]
            for (rowDx, colDx) in dirs {
                let newRow = row + rowDx
                let newCol = col + colDx

                if (0..<grid.count).contains(newRow),
                   (0..<grid[row].count).contains(newCol),
                   grid[newRow][newCol] == 1,
                   !visited[newRow][newCol] {
                        size += dfs(newRow, newCol)
                   }
            }

            return size
        }


        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == 1, !visited[row][col] {
                    let area = dfs(row, col)
                    maxArea = max(maxArea, area)
                }
            }
        }


    return maxArea

    }
}

/*




*/