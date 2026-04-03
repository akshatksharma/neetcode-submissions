class Solution {

    /*
    breakdown
    - 2d 9x9 array that should have digits 1-9 or "."
        could the array have literally anything? or can i expect it to just have numbers
    
    edge cases
    - non numeric digits
    - duplicates

    approaches
    - brute force: 
        check each row -> O(N^2) where N = 9, 81 ops, constant space
        check each col -> ''
        check each grid -> ''
    - hashmap
        check row -> build set and check counts, O(N) where N = 9, space is O(N)
        check col -> ''
        check grids


    */

    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        // check rows
        for rowIdx in 0..<board.count {
            var set = Set<Character>()
            for i in 0..<board[rowIdx].count {
                let char = board[rowIdx][i]
                guard char != "." else { continue }

                if set.contains(char) {
                    return false
                } else {
                    set.insert(char)
                    continue
                }
            }
        }

        // check cols
        for colIdx in 0..<board.count {
            var set = Set<Character>()
            for i in 0..<board.count {
                let char = board[i][colIdx]
                guard char != "." else { continue }

                if set.contains(char) {
                    return false
                } else {
                    set.insert(char)
                    continue
                }
            }
        }

        // check grids -- we need to do a 3x3 scan starting from 3 areas
        let gridSize = board.count / 3
        for startRow in 0..<gridSize {
            for startCol in 0..<gridSize {

                var set = Set<Character>()
                
                for i in 0..<gridSize {
                    for j in 0..<gridSize {
                        let row = (gridSize * startRow) + i
                        let col = (gridSize * startCol) + j
                        let char = board[row][col]
                        
                        guard char != "." else { continue }

                        if set.contains(char) {
                            return false
                        } else {
                            set.insert(char)
                            continue
                        }
                    }
                }
            }
        }


        return true
    }
}
