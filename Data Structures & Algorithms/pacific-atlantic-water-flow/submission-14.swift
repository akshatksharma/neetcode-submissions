class Solution {
    struct Item: Hashable {
        let row: Int
        let col: Int
    }

    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var pacificReachable = Set<Item>()
        var atlanticReachable = Set<Item>()

        func dfs(
            _ row: Int, 
            _ col: Int, 
            _ visited: inout Set<Item>) {  
            // do stuff for the current item
            visited.insert(Item(row: row, col: col))

            // recurse on neighbors
            for (rowDx, colDx) in [(1,0), (0, 1), (-1, 0), (0, -1)] {
                let newRow = rowDx + row
                let newCol = colDx + col

                if (0..<heights.count).contains(newRow),
                   (0..<heights[newRow].count).contains(newCol),
                   !visited.contains(Item(row: newRow, col: newCol)),
                   heights[newRow][newCol] >= heights[row][col] { // cause we're going backwards
                    dfs(newRow, newCol, &visited)
                   }
            }

        }

        // dfs to get pacific
        for row in 0..<heights.count {
            dfs(row, 0, &pacificReachable)
        }
        for col in 0..<heights[0].count {
            dfs(0, col, &pacificReachable)
        }

        // dfs to get atlantic
        for row in 0..<heights.count {
            dfs(row, heights[0].count-1, &atlanticReachable)
        }
        for col in 0..<heights[0].count {
            dfs(heights.count-1, col, &atlanticReachable)
        }

        let bothReachable = pacificReachable.intersection(atlanticReachable)
        let ans = bothReachable.map { [$0.row, $0.col] }
        return ans
    }

    /*
        heights r,c = height above sea level at r, c

        find what can go into both pacific and atlantic

            pacific
                if row <= 0
                if col <= 0
            atlantic
                if row >= heights.count -1
                if col >= heights[row].count - 1

        approach
            we do a dfs from each row and col for atlantic and pacific

            if our row and col is at our end coordinates (above) we return true
            we add the row/col to our visited set
            and then we recurse on the neighbors iff the neighbor has a lesser value amd we haven't visited it
                if any neighbor is true, we insert into a solution set

            we'll have 2 solution sets ... one for atlantic and one for pacific
            the intersection of those sets is our answer

        time complexity
            for each of atlantic and pacific, we'll do dfs on each item, but should only hit
            each item once ... so ...
            time: O(N*M) where N and M are the # rows and cols
            space: O(N*M) due to our visited sets and answer sets 

        PACIFIC

        2   5   4    ATLANTIC
PACIFIC
        10  4   10

        1   2   5

        ATLANTIC

    */
}
