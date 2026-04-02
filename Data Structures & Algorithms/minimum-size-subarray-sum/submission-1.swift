class Solution {

    /*
    breakdown
    - positive integers in the array
    - greater than or equal to target
    - need subarray, so no sorting

    edge cases
    - empty array? -> return 0
    - when we don't have a valid soln -> return 0

    implementations

    - brute force -> O(N^2)
        - create all subarrays from all starting points, see which ones are valid (i.e add to target) and store smallest length
    - optimized soln -> O(N)
        - increasing the size of the subarray is useless once we reach our target ... since all nums are positive adding any new nums will ot give us the minimal length subarray
        - lot overlap between the subarrays
        - screams to me that we can build up our subarrays as we go

        - have 2 pointers indicating the L and R side of the subarray + another var for the smallest subarray len
        - increase the R side til the end of the array
            when we hit our target sum, then
            - track the len of the subarray
            - scoot up our starting point until we go below the target sum, so that we can continue 
    
    [1, 2, 3, 4, 2] target = 6 -> 2
    [] target = 5 -> 0
    [1, 2, 1] target = 5 -> 0

    */

    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var L = 0
        var currSum = 0, minLen = Int.max
        var didUpdate = false

        for R in 0..<nums.count {
            currSum += nums[R]

            while currSum >= target {
                didUpdate = true
                minLen = min(minLen, R - L + 1)
                currSum -= nums[L]
                L += 1
            }
        }

        if !didUpdate {
            return 0
        } else {
            return minLen
        }
    }
}
