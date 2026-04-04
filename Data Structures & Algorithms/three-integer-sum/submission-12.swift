class Solution {

    /*
    breakdown
    - array -> array of indices

    edge cases
    - empty array -> [] (n/a, will have at least 3)
    - negative / 0 numbers (yes any integer)
    - duplicates? yes



    [-1, 0, 1, 2, -2] -> [[-1, 0, 1], [-2, 2, 0]]

    implementations

    - brute force: search every triplet -> O(N^3)
    - n * 2sum

        nums[i] + nums[j] + nums[k] = 0
        nums[k] = 0 - (nums[i] + nums[j])

        2sum with nums[i] + nums[j] needing to equal nums[k]
    - n * 2sum with sorted array
        2sum for every n -> O(n^2) time, O(n) space
        to do without space, we could also sort the array and then do the 2 pointers approach
            [-1, -2, 0, 1, 2]

            nlogn sort (once), then n operations n times, o^2 ... no extra space
    */

    func threeSum(_ nums: [Int]) -> [[Int]] {
        var ans = Set<[Int]>()
        for k in 0..<nums.count {

            // 2 Sum
            let target = -nums[k]
            var map = [Int: Int]()

            for idx in 0..<nums.count {
                guard idx != k else { continue }

                let complement = target - nums[idx]

                if let complementIdx = map[complement], complementIdx != k {
                    let triplet = [nums[idx], nums[complementIdx], nums[k]].sorted() // constant time WRT to N since its always 3
                    ans.insert(triplet)
                }

                map[nums[idx]] = idx
            }
        }

        return ans.map { $0 }
    }
}
