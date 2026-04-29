class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var exists = Set<Int>()
        var visited = Set<Int>()
        var ans = 0

        nums.forEach {
            exists.insert($0)
        }

        for num in nums {
            guard !exists.contains(num-1) && !visited.contains(num) else {
                continue
            }

            var currentNum = num + 1
            var currentCount = 1
            while exists.contains(currentNum) {
                currentCount += 1
                visited.insert(currentNum)

                currentNum += 1
            }
            ans = max(ans, currentCount)
        }

        return ans
    }

    /*
    [1, 10, 0, 2, 3, 4]

    [2, 1, 10, 0, 2, 3]


    brute force
        for each nums[i], count the longest sequence
            have a count
            until you reach end of the array
                scan for target number: starting at nums[i]+1
                    if you find it, 
                        increment the count
                        increment target
            compare the count to the max count so far

        O(n^2) time, O(1) space

    optimized
        we do a lot of work to find what number we want
        for each nums[i] we know exactly what number we want in the sequence
        we could store a hashmap mapping the val to the index

        for each nums[i] 
            initialize a count
            we see if nums[i] in the visited map 
                (if it is, we can ignore since we alr visited it as a part of a chain, so the value should be larger)
                if not
                    we check if nums[i] + 1 is in the hashmap
                    if it is, then we increment our count
        
        it's important we start checking if and only if we don't have a nums[i] - 1 in our hashmap
            otherwise we can't guarantee that a value in our visited will always have a lesser count
            and we'd need to count every item

        O(n) time (we only go through each element once)
        O(n) space (exists and visited sets)

    */
}
