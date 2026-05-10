class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var candidates = candidates.sorted()
        var ans = [[Int]]()
        var currentComb = [Int]()

        func dfs(_ startIdx: Int, _ target: Int) {
            // base cases
            if target == 0 {
                ans.append(currentComb)
                return
            }

            if target < 0 {
                return
            }

            for i in startIdx..<candidates.count {
                if i > startIdx && candidates[i] == candidates[i-1] {
                    continue
                }

                currentComb.append(candidates[i])
                dfs(i+1, target - candidates[i])
                currentComb.removeLast()
            }

        }

        dfs(0, target)

        return ans
    }

    /*
        candidates: array of ints + target -> return all unique combs of candidates where we sum to target

        [1,3,2,4,2] target = 5
            -> [2,3] [1,4] [1,2,2]

        [1] target = 1 
            -> [1]

        notes
            - can only choose element ONLY ONCE 
            - can NOT have duplicate solutions
            - combination can be in any order
        
        approaches
        - we're building subsets, so I think we'll have to use a backtracking approach
        - items can be anywhere in the array

        backtracking
            need to focus on duplicates

            [1,3,2,4,2] -> [1,2,2,3,4] 
                sort is dominated by other work

            1 2 2 3 target = 5

                            _
              1             2         2        3 
          12      12   13      2    3     3   
      122  123   123   13       ....

        some of these will make it to target ... but we have dupes
            if we encounter a sum while building up to a sum, we should skip it
            in future calls


            TLDR for a given item we'll try all the items ahead of it, adding and removing
            as we go .. as we recurse we'll reduce the target that we're looking for
                when our target is 0, we know that our current array is valid, so we'll
                append it to our ans

            for each item in our array we can add/remove it ... 2^N decisions
                for each we could append ever item in the array so, N work

                O(N*2^N)

    */
}
