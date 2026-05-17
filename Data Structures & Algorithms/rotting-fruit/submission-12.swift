import Collections 

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        // intialize state
        var time = 0
        var numFreshFruit = 0
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var queue = Deque<(Int, Int)>() // row, col

        // 1st pass on grid
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                switch grid[row][col] {
                    case 1:
                        numFreshFruit += 1
                    case 2:
                        queue.append((row, col))
                    default:
                        continue
                }
            }
        }
        
        // check grid state
        if numFreshFruit == 0 {
            return 0
        }

        if queue.isEmpty {
            return -1
        }

        // run bfs per level

        
        while !queue.isEmpty {
            let level = queue.count
            
            for _ in 0..<level {
                
                let (row, col) = queue.popFirst()!

                // update time, # fresh fruits
                let directions = [(1,0), (0,1), (-1,0), (0,-1)]
                for (rowDx, colDx) in directions {
                    let newRow = row + rowDx
                    let newCol = col + colDx

                    if (0..<grid.count).contains(newRow),
                    (0..<grid[row].count).contains(newCol),
                    !visited[newRow][newCol],
                    grid[newRow][newCol] == 1 {
                        visited[newRow][newCol] = true
                        numFreshFruit -= 1
                        queue.append((newRow, newCol))
                    }
                }
            }

            time += 1
        }

        // return time if we have freshFruit still
        guard numFreshFruit == 0 else { return -1 }

        return time - 1
    }
}

/*
    0 = empty
    1 = fresh fruit
    2 = rotten

    every minute adjacent fresh fruits next to rotten fruits become rotten

    return min minutes until there are 0 fresh fruits


    0 0 0 
    0 1 0      -> -1
    0 0 0 

    0 0 0 
    0 2 0       -> 0 
    0 0 0

    0 0 1 
    0 2 0       -> -1
    0 0 0

    0 0 1 
    0 2 1       -> 2
    0 0 0

    need some kind of graph traversal while finding shortest paths from rotten fruits

        DFS / BFS
            -> DFS isn't as ideal here cause we'll have to check every node from
                every other node ... we can't guarantee that the first time we 
                encounter a node that it'll be the shortest time/distance

            -> BFS from every rotten fruit

                do an initial pass on the grid
                    count # of fresh fruit
                    put all rotten fruit coords in a queue (plus time == 0)

                        if we have no fresh fruits, return 0
                        if we have no rotten fruits (queue empty), return -1

                    kick off bfs and add in bounds neighbors to queue with time + 1
                        each time we pop off an item from queue we -1 our # fresh fruit
                        we also update our time counter
                        also add to visited

                
                if # of fresh fruit isn't 0, then we return -1
                else return time counter

                time: O(N) (using visited 2d array we only hti each node 2x, in first pass and then in bfs loop)
                space: O(N) (due to visited array)

*/
