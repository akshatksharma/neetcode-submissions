class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var newImage = image
        let originalColor = image[sr][sc]

        guard originalColor != color else {
            return image
        }

        /*
        0 2 1 0
        0 1 1 0
        0 1 1 0

        (0,1) and 2
        */

        func dfs(_ row: Int, _ col: Int) {
            // do our work at the node
            newImage[row][col] = color

            // recurse on children
            let directions = [(1,0), (-1, 0), (0, 1), (0, -1)]

            for (rowDx, colDx) in directions {
                let newRow = row + rowDx
                let newCol = col + colDx

                if (0..<newImage.count).contains(newRow) 
                   && (0..<newImage[newRow].count).contains(newCol)
                   && newImage[newRow][newCol] == originalColor {
                        dfs(newRow, newCol)
                   }
            }
        }

        dfs(sr, sc)
        return newImage
    }

    /*
    m rows n cols of ints
    i,j is the pixel val of the image

    do flood fill starting from i,j = sr sc

        flood fill = change pixel colors starting from sr , sc
            update direct neighbors (horz, vert) that have same color ... not diag


        0 1 1 0
        0 1 1 0
        0 1 1 0

        sr sc = 0,1 -> color = 2

        0 1 1 0
        0 1 1 0
        0 1 1 0

            dfs(i, j, oldColor, newColor)
                update i,j to color
                recurse on neighbors at all 4 directions
                    make sure not out of bounds
                    make sure neighbor val is the same as oldColor (we don't need a visited array or whatever bc we can modify the image)

            O(n^2) -> we're not going to go to a valid node more than once
            O(1) if we modify the input, O(n^2) if we return a new image
    */
}
