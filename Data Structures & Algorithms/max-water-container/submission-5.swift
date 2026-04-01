class Solution {

    /*
    breakdown
    - water area from the max size container in heights
    - water area formula for 2 heights i and j
        A = L * W = min(h_i, h_j) * (abs(i - j))
    
    edge cases
    - heights length - at least 2 heights always
    - height magnitude -- can have 0 values

    [1, 5, 0, 5, 6, 7]
    [1, 5, 4, 3, 4]
    [1, 2, 1]

    approach
    - can't sort
    - brute force: for each height, look at all heights after and calc areas, keep track of max area
        N^2
    
    if we find a taller height, we want to make that our container
        i and j refer to heights of containers
        we start at the start of the array and calc the area
            then, if j's height > i's height, we set i to j (make it the starting height) and j -> j + 1
                if j's height is < i's height we continue progressing j and calc the other areas
    */

    func maxArea(_ heights: [Int]) -> Int {
        var i = 0, j = heights.count - 1
        var maxHeight = 0

        while i < j{
            let height = calcHeight(i, j, heights)
            maxHeight = max(height, maxHeight)

            if heights[i] < heights[j] {
                i += 1
            } else {
                j -= 1
            }
        }

        return maxHeight
    }

    private func calcHeight(_ i: Int, _ j: Int, _ heights: [Int]) -> Int {
        guard i < heights.count && j < heights.count else { return 0 }

        let width = abs(i - j)
        let height = min(heights[i], heights[j])

        return width * height
    }
}
