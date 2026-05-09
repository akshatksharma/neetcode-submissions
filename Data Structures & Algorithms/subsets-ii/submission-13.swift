class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var subsets = [[Int]]()
        var subset = [Int]()

        func dfs(_ startIdx: Int) {
            subsets.append(subset)
            for i in startIdx..<nums.count {
                if i > startIdx, nums[i] == nums[i-1] {
                    continue
                }

                subset.append(nums[i])
                dfs(i+1)
                subset.removeLast()
            }
        }

        dfs(0)

        return subsets
    }

    /*
                2, 2, 1


                            _
                    2                   _
              2,2        2          2      _

         2,2,1   2,2   2,1   2    2,1  2    1   _   
    */
}
