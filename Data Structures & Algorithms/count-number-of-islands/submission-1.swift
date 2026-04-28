class Solution {
    struct Item: Hashable {
        let row: Int
        let col: Int
    }

    func numIslands(_ grid: [[Character]]) -> Int {
        var numIslands = 0
        var visited = Set<Item>()

        func dfs(_ row: Int, _ col: Int) {
            visited.insert(Item(row: row, col: col))

            let directions = [(1,0), (0,1), (-1, 0), (0, -1)]

            for (rowDx, colDx) in directions {
                let newRow = rowDx + row
                let newCol = colDx + col

                if (0..<grid.count).contains(newRow),
                   (0..<grid[newRow].count).contains(newCol),
                   grid[newRow][newCol] == "1",
                   !visited.contains(Item(row: newRow, col: newCol)) {
                    dfs(newRow, newCol)
                   }
            }

        }

        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if !visited.contains(Item(row: row, col: col)), 
                   grid[row][col] == "1" {
                    dfs(row, col)
                    numIslands += 1
                }
            }
        }

        return numIslands
    }

    /*
    for each i,j in the grid
        if grid[i][j] == 1 and not in set
            kick off a dfs
            when it returns increment by 1

        func dfs(i, j) 
            recurse through all adjacent 1s and update a visited set


        time O(n^2) where n is the size 
        space: O(n^2) for set

    */
}
