class Solution {

    /*
        problem breakdown:
            * need to return index array, smaller idx first
            * indexes cannot be the same
            * dont need to worry about empty arrays, or if the condition doesn't work out

        brute force: check every the complement (target - num) for every num
        * time O(N^2)
        * space O(1)

        map: optimize the O(N) search process by setting up a map that maps value to index. then search for the complement in that set and return the index of the num and the complement
        * time O(N) (to setup the set + search for all the complements in worst case)
        * space O(N) (to store the set)


        [3, 1, 5], 7
    */

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]

        // set up set
        nums.enumerated().forEach { idx, num in
            map[num] = idx
        }

        for (idx, num) in nums.enumerated() {
            let complement = target - num
            if let complementIdx = map[complement], idx != complementIdx {
                return [idx, complementIdx]
            }
        }

        return []
    }
}
