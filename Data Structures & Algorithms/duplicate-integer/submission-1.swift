class Solution {
    /*
        brute force (N^2): check each element for each element -- if dupe, then return false
        sorting (NlogN): sort so that dupes next to each other, then scan and compare adjacent elements
        set O(N) time and space: store elems in set, if it exists, then return false
    */
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var set: Set<Int> = Set()

        for num in nums {
            if !set.contains(num) {
                set.insert(num)
            } else {
                return true
            }
        }

        return false
    }
}
