class Solution {

    struct Node: Hashable {
        let row: Int
        let col: Int

        init(_ row: Int, _ col: Int) {
            self.row = row
            self.col = col
        }
    }

    func numIslands(_ grid: [[Character]]) -> Int {
        var numIslands = 0
        var visited = Set<Node>()

        func dfs(_ node: Node) {
            // add to visited
            visited.insert(node)

            // iterate through valid neighbors
            let directions = [(0,1), (1,0), (0,-1), (-1,0)]
            for (rowDx, colDx) in directions {
                let newNode = Node(node.row+rowDx, node.col+colDx)

                if (0..<grid.count).contains(newNode.row),
                   (0..<grid[node.row].count).contains(newNode.col),
                   grid[newNode.row][newNode.col] == "1",
                   !visited.contains(newNode) {
                    dfs(newNode)
                   }
            }
        }

        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                let node = Node(row, col)
                if !visited.contains(node), grid[row][col] == "1" {
                    dfs(node)
                    numIslands += 1
                }
            }
        }

        return numIslands
    }
}
