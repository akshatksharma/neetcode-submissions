import Collections

class Solution {

    struct Item: Hashable {
        let row: Int
        let col: Int
    }

    func solve(_ board: inout [[Character]]) {
        var borderZeros = Set<Item>() // coords for zeros touching the border

        var queue = Deque<(Int, Int)>()

        // add 0s on left and right cols
        for row in 0..<board.count {
            if board[row][0] == "O" {
                queue.append((row,0))
                borderZeros.insert(Item(row: row, col: 0))
            }

            let lastIdx = board[row].count - 1
            if board[row][lastIdx] == "O" {
                queue.append((row,lastIdx))
                borderZeros.insert(Item(row: row, col: lastIdx))
            }
        }

        // add 0s on top and bottom rows
        for col in 0..<board[0].count {
            if board[0][col] == "O" {
                queue.append((0,col))
                borderZeros.insert(Item(row: 0, col: col))
            }

            let lastIdx = board.count - 1
            if board[lastIdx][col] == "O" {
                queue.append((lastIdx, col))
                borderZeros.insert(Item(row: lastIdx, col: col))
            }
        }

        // bfs
        while let (row, col) = queue.popFirst() {
            
            let directions = [(1,0), (0,1), (-1,0), (0,-1)]

            for (rowDx, colDx) in directions {
                let newRow = row + rowDx
                let newCol = col + colDx

                if (0..<board.count).contains(newRow),
                   (0..<board[row].count).contains(newCol),
                   board[newRow][newCol] == "O",
                   !borderZeros.contains(Item(row: newRow, col: newCol)) {
                        borderZeros.insert(Item(row: newRow, col: newCol))
                        queue.append((newRow, newCol))
                   }
            }
        }

        // update grid
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if board[row][col] == "O", !borderZeros.contains(Item(row: row, col: col)) {
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
