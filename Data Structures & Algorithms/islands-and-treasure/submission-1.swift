import Collections

class Solution {
    func islandsAndTreasure(_ grid: inout [[Int]]) {
        let inf = 2147483647
        var queue = Deque<(Int, Int, Int)>() // row, col, distance

        // initialize queue with all treasures
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == 0 {
                    queue.append((row, col, 0)) // distance from treasure is 0
                }
            }
        }

        // run bfs while queue isn't empty
        while let (row, col, distance) = queue.popFirst() {
            // update grid to distance + 1 if it's inf
            if grid[row][col] == inf { 
                grid[row][col] = distance
            }

            // add neighbors to queue
            let directions = [(1,0), (0,1), (-1,0), (0,-1)]
            for (rowDx, colDx) in directions {
                let newRow = row + rowDx
                let newCol = col + colDx

                if (0..<grid.count).contains(newRow), // in row bounds
                   (0..<grid[row].count).contains(newCol), // in col bounds
                   grid[newRow][newCol] == inf { // needs to be updated
                    queue.append((newRow, newCol, distance + 1))
                   }
            }
        }
    }
}

/*
    -1: water (cannot traverse)
    0: treasure
    inf: land (can traverse)

    fill each land cell with distance to nearest treasure 
        if land cell can't reach, should remain inf

        [3,-1, 0, inf],
        [2, 2, 1, -1],
        [1,-1,inf,-1],
        [0,-1,inf,inf]

        [L,-1, 0, L],
        [L, L, L,-1],
        [L,-1,L,-1],
        [0,-1,L,L]


    brute force
        from every single row,col -- kick off a search in every valid direction (in bounds, not -1)
            if 0, return path

        at every step we increment by 1 and then when we reach a 0 we return the passed in num
        take the min of the search at each point and update our node value with that

        time: O(4^n) ... we'll need to hit every point from every point since we could need to update a node to a smaller value
        space: O(1)

    optimized
        multi source bfs ... 
            load all treasure nodes into queue and update adjacent values with 
            distance from the treasure (we can modify the graph)

            time: O(n) ... only need to hit every node 1 time and do constant work
            space: O(n): we only every have at most 4*# of treasures in our queue, worst case
                        everything is a treasure
*/
