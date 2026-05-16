class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var numIslands = 0
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)

        func dfs(_ row: Int, _ col: Int) {
            // update state
            visited[row][col] = true

            // look at valid children
            var directions = [(1,0), (0,1), (-1,0), (0,-1)]
            for (rowDx, colDx) in directions {
                let newRow = row + rowDx
                let newCol = col + colDx

                // check for valid children (in bounds, is 1, not visited)
                if (0..<grid.count).contains(newRow),
                   (0..<grid[newRow].count).contains(newCol),
                   grid[newRow][newCol] == "1",
                   !visited[newRow][newCol] {
                        dfs(newRow, newCol)
                   }
            }
        }   

        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == "1", !visited[row][col] {
                    dfs(row, col)
                    numIslands += 1
                }
            }
        }

        return numIslands
    }
}

/*
    dfs with visited array
        only go onto 1s that we haven't visited
        within dfs we track visited
        after exhausting all neighbors we return out and incrmenet our # of islands

        O(n) time (where n is the # of items in our grid) due to going in each idx once
        O(n) space due to tracking visited
*/
