import Collections

class Solution {
    
    class UnionFind {
        private var parents: [Int]
        private var ranks: [Int]

        init(_ numNodes: Int) {
            self.parents = Array(0..<numNodes) // default everything is it's own root
            self.ranks = Array(repeating: 0, count: numNodes)
        }

        func find(_ node: Int) -> Int { // find roots
            guard node != parents[node] else { return node } // we found the root (i.e node is it's own parent)
            
            let parent = find(parents[node]) // recurse upwards on node's parent
            parents[node] = parent

            return parent
        }

        func union(_ node1: Int, _ node2: Int) -> Bool {
            let root1 = find(node1)
            let root2 = find(node2)

            guard root1 != root2 else { return false } // we have a cycle

            if ranks[root1] > ranks[root2] {
                parents[root2] = root1
            } else if ranks[root2] > ranks[root1] {
                parents[root1] = root2
            } else {
                parents[root1] = root2
                ranks[root2] += 1
            }

            return true
        }

        func isConnected(_ node1: Int, _ node2: Int) -> Bool {
            find(node1) == find(node2)
        }
    }

    func solve(_ board: inout [[Character]]) {
        let numRows = board.count
        let numCols = board[0].count
        let unionFind = UnionFind((numRows * numCols) + 1)
        let dummyIdx = numCols * numRows

        // add 0s on all borders
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                guard board[row][col] == "O" else { continue }

                if row == 0 || row == board.count - 1 || col == 0 || col == board[row].count - 1 {
                    let idx = (numCols * row) + col
                    unionFind.union(dummyIdx, idx)
                }
            }
        }

        // union adjacent 0s
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                guard board[row][col] == "O" else { continue }

                let directions = [(1,0), (0,1)]
                for (rowDx, colDx) in directions {
                    let newRow = row + rowDx
                    let newCol = col + colDx

                    if newRow < numRows, newCol < numCols, board[newRow][newCol] == "O" {
                        let node1Idx = row * numCols + col
                        let node2Idx = newRow * numCols + newCol
                        unionFind.union(node1Idx, node2Idx)
                    }
                }
            }
        }
        

        // update grid
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                let idx = row * numCols + col
                if board[row][col] == "O", !unionFind.isConnected(idx, dummyIdx) { // O not connected to border
                    board[row][col] = "X"
                }
            }
        }
    }
}

/*

  ["X","X","X","X"],
  ["X","O","O","X"],
  ["X","O","O","X"],
  ["X","X","X","O"]

  ["X","X","X","X","X","X"],
  ["X","O","O","X","X","X"],
  ["X","O","O","O","X","X"],
  ["X","O","O","O","X","X"]


    do a bfs from every node on an edge and add to a hashmap

    then do another loop through the grid, if we get to a 0 
    that's not in the grid, then mark it as X
        time: O(N)
        space: O(N)
*/
