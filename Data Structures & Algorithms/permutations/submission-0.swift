class Solution {
func permute(_ nums: [Int]) -> [[Int]] {
        var permutations = [[Int]]()
        var currPermutation = [Int]()
        var currPermutationExistence = Set<Int>()

        func backtrack() {
            // basecase
            if currPermutation.count == nums.count {
                permutations.append(currPermutation)
                return
            }

            for num in nums {
                guard !currPermutationExistence.contains(num) else { continue }
                currPermutation.append(num)
                currPermutationExistence.insert(num)
                backtrack()
                currPermutation.removeLast()
                currPermutationExistence.remove(num)
            }
        }

        backtrack()

        return permutations
    }
}
