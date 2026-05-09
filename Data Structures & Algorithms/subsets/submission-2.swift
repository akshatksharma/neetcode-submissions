class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var subsets = [[Int]]()
        var currentSubset = [Int]()

        func dfs(_ startIdx: Int) {
            subsets.append(currentSubset)
            for i in startIdx..<nums.count {
                currentSubset.append(nums[i])
                dfs(i + 1)
                currentSubset.popLast()
            }
        }

        dfs(0)

        return subsets
    }

    /*
        [1]
            [] [1]

        [1,2]
            [] [1] [2] [1,2]

        [1,2,3]
            [] [1] [2] [3] [1,2] [1,3] [2,3] [1,2,3]

            for each item, we can either pick or not pick it
            _
            1
            1 2
            1 2 3
            1 

            backtracking approach where we have 2 
    */
}
