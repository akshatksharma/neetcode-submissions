class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var subsets = [[Int]]()
        var subset = [Int]()

        // 1 1 2

        func dfs(_ startIdx: Int) {
            subsets.append(subset) // double check location of this

            for i in startIdx..<nums.count {
                if i > startIdx && nums[i] == nums[i-1] {
                    continue
                }
                subset.append(nums[i])
                dfs(i + 1)
                _ = subset.popLast()
            }
        }

        dfs(0)

        return subsets
    }


    /* 
        what is a duplicate subset? it just cant have the same values as
        another subset?

        1 2 1 - we can choose to include to not include every item

                           _                                  
                    1                 _                       0
               1,2    1          2        _                   1
        1,2,1   1,2  1,1  1   2,1  2    1    _                2
                

                1,2 == 2,1
                1 == 1
    */
}
