class Solution {

    /*
        [0,2,0,3,1,0,1,3,2,1]
    */

    func trap(_ height: [Int]) -> Int {
        var ans = 0
        var l = 0
        var r = height.count - 1

        var leftMax = height[l]
        var rightMax = height[r]

        while l < r {
            if rightMax < leftMax {
                r -= 1
                ans += max(0, rightMax - height[r])
                rightMax = max(rightMax, height[r])
            } else {
                l += 1
                ans += max(0, leftMax - height[l])
                leftMax = max(leftMax, height[l])
            }
        }

        return ans
    }
}
