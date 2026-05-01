class Solution {

    /*
        [0, 5, 2, 5, 10]

        [0, 5, 2, 6, 10]

        [0, 5, 2, 4, 10]
    */

    func maxArea(_ heights: [Int]) -> Int {
        var maxArea = Int.min
        guard heights.count >= 2 else { return maxArea }

        var L = 0
        var R = heights.count - 1

        while L < R {
            // calc area
            let currentArea = (R - L) * min(heights[L], heights[R])
            maxArea = max(maxArea, currentArea)

            if heights[L] < heights[R] {
                L += 1
            } else {
                R -= 1
            }
        }

        return maxArea
    }

    /*
    heights = height of the ith bar
    can pick any 2 to form container
    return max water

    bounds
    - at least 2 bars
    - bar values can be 0?
    
    0  1  2  3   4
    2, 5, 0, 10, 2

        = ((3 - 1) + 1) * min(5, 10)

    2, 10, 0, 5, 2

    approach
    brute force 
        try every pair, O(n^2)
        we can try to narrow the pairs we look at

    sliding window
        L and R at 0 and 1
    
        while R is in bounds
            calc max area
            if val at R > val at L, make L = R and R+=1

        O(n) since we slide over the all values



    */
}
