class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var subsets = [[Int]]()
        var currentSubset = [Int]()

        func dfs(_ startIdx: Int) {
            if startIdx >= nums.count {
                subsets.append(currentSubset)
                return
            }

            currentSubset.append(nums[startIdx])
            dfs(startIdx + 1)
            _ = currentSubset.popLast()
            dfs(startIdx + 1)
        }

        dfs(0)
        return subsets
    }

    /*
    []

    [1]

    [1,2]

    [1,2,3]

        []
        [1]
        [1,2]
        [1,2,3]
        [1,3]
        [2]
        [2,3]
        [3]

        backtracking approach - N * 2^N ... appending up to N times per 2^N subsets
            dfs that takes in the index we start at
            update currentSubset and global subset
    */
}
