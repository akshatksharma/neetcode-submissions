class Solution {

    struct GridItem: Hashable {
        let row: Int
        let col: Int
    }

    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let word = Array(word)
        var currentPath = Set<GridItem>()

        func dfs(_ row: Int, _ col: Int, _ i: Int) -> Bool {
            if i == word.count {
                return true
            }

            if !(0..<board.count).contains(row) || 
               !(0..<board[row].count).contains(col) {
                return false
            }

            if board[row][col] != word[i] {
                return false
            }

            let gridItem = GridItem(row: row, col: col)

            if currentPath.contains(gridItem) {
                return false
            }

            currentPath.insert(gridItem)

            let directions = [(0,1), (0,-1), (1,0), (-1,0)]
            for (rowDx, colDx) in directions {
                let newRow = row + rowDx
                let newCol = col + colDx
                if dfs(newRow, newCol, i+1) {
                    return true
                }
            }

            currentPath.remove(gridItem)

            return false
        }

        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if dfs(row, col, 0) {
                    return true
                }
            }
        }


        return false
    }

    /*
        2D grid ... return true if word within grid
            within ==
            - same chars
            - same order

        things to note
        - can't go through cell more than once
        - go through horz/vertically
        - handle case sensitvity


        ["A","B","T","D"],
        ["T","A","A","C"],
        ["M","C","A","E"]

        approaches
            brutest force: O(4^n)
                from every node, start a dfs and build up a chain 
                    if we've found one, return
                    if our chain is size word.count
                         if equal word (or word.reversed), set var to true
                         return
                    explore neighbors
                    pop from our chain

            hashmap + dfs O(4^n)
                we could only backtrack into the chars that are within word until we reach word.count
                    

    */
}
