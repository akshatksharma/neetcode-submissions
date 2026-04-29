class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var ans = Array(repeating: 1, count: nums.count)

        /*

            4 2 4 6 
                     L       R
            0    1 -> (1) * (2*4*6)   0
            1    2 -> (4) * (4*6)     1
            2    4 -> (4,2) * (6)     2
            3    6 -> (4*2*4) * (1)   3
            
            1 0 4 6

        */

        var prefix = 1
        for i in 1..<nums.count {
            prefix *= nums[i-1]
            ans[i] = prefix
        }

        var suffix = 1
        for j in stride(from: nums.count-2, through: 0, by: -1) {
            suffix *= nums[j+1]
            ans[j] *= suffix
        }

        return ans
    }

    /*
        brute force: 
        we muliply all other numbers but don't include the one at i -- O(n^2) time

        in terms of going past that: 
            naively we could multiply all the numbers then for each i in nums output[i] will be that/ nums[i]
                but dividing by 0 is tough

            what if we created L and R products 
            we can do this in 2 passes

            1 2

            1 2 4 6 
                     L       R
            0    1 -> (1) * (2*4*6)   3
            1    2 -> (1) * (4*6)     2
            2    4 -> (1,2) * (6)     1
            3    6 -> (1*2*4) * (1)   0
            
            1 0 4 6
        
    */
}
