class Solution {
    /* 
    _ [0,2,0,3,1,0,1,3,2,1]
    L [0,2,2,3,3,3,3,3,2,1]
    R [3,3,3,3,3,3,3,3,2,1]

           2   2 3 2       
    */

    func trap(_ height: [Int]) -> Int {
        var ans = 0
        var maxLefts = Array(repeating: 0, count: height.count)
        var maxRights = Array(repeating: 0, count: height.count)

        maxLefts[0] = height[0]
        for i in 1..<height.count {
            maxLefts[i] = max(maxLefts[i-1], height[i])
        }

        maxRights[height.count-1] = height[height.count-1]
        for i in stride(from: height.count-2, through: 0, by: -1) {
            maxRights[i] = max(maxRights[i+1], height[i])
        }

        for i in 0..<height.count {
            let rawHeight = min(maxRights[i], maxLefts[i]) - height[i]
            ans += rawHeight
        }

        return ans
    }

    /*
    for every i in heights
        lets keep track of the tallest height to the left and the 
        tallest height to the right
        can calc this in 2 passes

    then for every i we can do min(maxLeft, maxRight) - height[i]
    */
}
