class Solution {
    func key(_ i: Int, _ j: Int) -> String {
        "\(i)_\(j)"
    }

    func lengthOfLIS(_ nums: [Int]) -> Int {
        var memo = [String: Int]()

        func recurse(_ i: Int, _ j: Int) -> Int {
            if i >= nums.count {
                return 0
            }

            if let memoVal = memo[key(i,j)] {
                return memoVal
            }

            // max between picking the same value as before
            var ans = recurse(i+1,j)

            if j == -1 || nums[i] > nums[j] {
                // vs picking current value ... can only do this if our val at i is bigger
                ans = max(ans, 1 + recurse(i+1, i))
            }

            memo[key(i,j)] = ans
            
            return ans
        }

        return recurse(0,-1)
    }   

    /*
    - numbers can be 0 and negative
    - can have duplicates
    - at least 1 number

    F(i, j) = max ( F(i+1, j), 1 + F(i+1, i) ) 
        i is the index of the number we're considering
        j is the index of the last number we considered

        i >= nums.count -> 0
        nums[i] <= nums[j] -> 0

    time: O(n^2) where n is the size of nums
    space: O(n^2) to hold the dp table

    [1, 20, 2, 4] -> 3 (1,4)

                1

            20      1

                 2       1

              4         4   
        
        0 1 2 3 4
      0         0
      1         0    
      2         0
      3         0
      4 0 0 0 0 0 

    */
}
