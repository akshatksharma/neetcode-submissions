import Collections

class Solution {
    func solve(_ board: inout [[Character]]) {
        var queue = Deque<(Int, Int)>()

        // add 0s on all borders
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                guard board[row][col] == "O" else { continue }

                if row == 0 || row == board.count - 1 || col == 0 || col == board[row].count - 1 {
                    queue.append((row, col))
                    board[row][col] = "Z"
                }
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
                   board[newRow][newCol] == "O" {
                        board[newRow][newCol] = "Z"
                        queue.append((newRow, newCol))
                   }
            }
        }

        // update grid
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if board[row][col] == "O" {
                    board[row][col] = "X"
                }
            }
        }

        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if board[row][col] == "Z" {
                    board[row][col] = "O"
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
