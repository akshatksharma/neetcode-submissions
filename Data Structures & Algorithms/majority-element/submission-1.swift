class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var freqMap = [Int: Int]()
        let majorityCount = nums.count / 2

        for num in nums {
            freqMap[num, default: 0] += 1
        }

        for (num, freq) in freqMap {
            if freq > majorityCount {
                return num
            }
        }

        return -1
    }
}

/*
    nums: [5,5,1,1,1,5,5]
    majorityCount = 7 / 2 = 3

    {5: 4, 1: 3}

    nums: [2]
    majority count: 1 / 2 = 0

    [2: 1]

*/


/*

    it's not just the most common, but the complete majority 

    1. sort the array, then count how many times an element is the same ... nlogn time, O(1) space

    2. store frequencies in hashmap, count until we get more than n/2, and return that ... O(n) time, O(n) space




*/