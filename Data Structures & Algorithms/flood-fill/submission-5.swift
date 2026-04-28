class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        let originalColor = image[sr][sc]

        guard originalColor != color else { return image }
        
        var newImage = image
        var queue = [(Int, Int)]()
        queue.append((sr, sc))

        while !queue.isEmpty {
            // get value
            let (row, col) = queue.removeFirst()

            // do stuff
            newImage[row][col] = color

            // add valid children
            let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]

            for (rowDx, colDx) in directions {
                let newRow = row + rowDx
                let newCol = col + colDx

                if (0..<newImage.count).contains(newRow)
                  && (0..<newImage[newRow].count).contains(newCol)
                  && newImage[newRow][newCol] == originalColor {
                    queue.append((newRow, newCol))
                  }
            }
        }

        return newImage
    }
}
