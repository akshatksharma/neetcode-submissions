class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var subsets = Set<[Int]>()
        var subset = [Int]()

        // 1 1 2

        func dfs(_ i: Int) {
            if i == nums.count {
                subsets.insert(subset)
                return
            }

            subset.append(nums[i])
            dfs(i + 1)
            _ = subset.popLast()
            dfs(i+1)
        }

        dfs(0)
        return subsets.map { Array($0) }
    }


    /* 
        what is a duplicate subset? it just cant have the same values as
        another subset?

        1 2 1 - we can choose to include to not include every item

                           _                                  0
                    1                 _                       1
               1,2    1          2        _                   2
        1,2,1   1,2  1,1  1   2,1  2    1    _                3
                

                1,2 == 2,1
                1 == 1
    */
}
