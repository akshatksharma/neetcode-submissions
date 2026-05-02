class Solution {
    struct Node: Hashable {
        let row: Int
        let col: Int
    }

    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maxIslandSize = 0
        var visited = Set<Node>()

        func dfs(_ node: Node) -> Int {
            // do stuff
            visited.insert(node)

            var size = 1
            // go through neighbors
            let directions = [(1,0), (-1,0), (0,1), (0,-1)]
            for (rowDx, colDx) in directions {
                let newNode = Node(row: node.row+rowDx, col: node.col+colDx)

                if (0..<grid.count).contains(newNode.row),
                   (0..<grid[node.row].count).contains(newNode.col),
                   grid[newNode.row][newNode.col] == 1,
                   !visited.contains(newNode) {
                        size += dfs(newNode)
                   }
            }

            return size
        }

        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                let node = Node(row: row, col: col)
                if !visited.contains(node), grid[row][col] == 1 {
                    let islandSize = dfs(node)
                    maxIslandSize = max(maxIslandSize, islandSize)
                }
            }
        }

        return maxIslandSize
    }

        /*
        run dfs on each 1 in the grid
            return the size of the component from the dfs
            compare against max size seen so far

        time: O(V) (dfs through each node once)
        space: O(V) (to hold visited arary)

        */
}
