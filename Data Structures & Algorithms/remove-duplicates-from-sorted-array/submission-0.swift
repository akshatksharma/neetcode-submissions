class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return 1 }

        var writeIdx = 1

        for readIdx in 1..<nums.count {
            if nums[readIdx] != nums[readIdx-1] {
                nums[writeIdx] = nums[readIdx]
                writeIdx += 1
            }
        }

        return writeIdx
    }

    /*
    - non decreasing order array, remove dupes
    - return k such that first k is unique elements

    qs
    - need to maintain order in the array 
    - does it matter what the other elements in the array -> NO

            r
          w
    1 2 3 3 4 5

              r
          w
    1 3 4 5 4 5

    start write at 1
    for r in 1..<nums.count
        if the elem before is different // make sure we handle start edge case
            set nums[write] = nums[read]
            move write by 1

    O(n)


    */
}
