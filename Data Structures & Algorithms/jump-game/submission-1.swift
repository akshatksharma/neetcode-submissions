class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true } 

        var lastValidJumpPoint = nums.count - 1

        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if nums[i] + i >= lastValidJumpPoint {
                lastValidJumpPoint = i
            }
        }

        return lastValidJumpPoint == 0
    }
}

/*
 - nums is max jump length at position i 
 - need to see if you can reach position nums.count - 1 from 0
 
 questions
 ... can nums be 0? 
 ... how many nums do we get?
    

 examples
     0 1 2 3 4
    [1,2,0,1,0]
        -> YES

        4 -> 3 -> 1 -> 0


    [1,2,0,0,0]
        -> NO

    [1]
        -> YES


approach O(N)
    if count == 1 -> TRUE
    ELSE
        work backwards from i = nums.count - 2, validJumpPoint = nums.count - 1
        if i + nums[i] == validJumpPoint, then it becomes the validJumpPoint

        in the end, if validJumpPoint == 0, then we can jump from 0


*/
