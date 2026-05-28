class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {

        func merge(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
            var newArray = [Int]()

            var i = 0
            var j = 0
            while i < arr1.count && j < arr2.count {
                if arr1[i] < arr2[j] {
                    newArray.append(arr1[i])
                    i += 1
                } else {
                    newArray.append(arr2[j])
                    j += 1  
                }
            }

            while i < arr1.count {
                newArray.append(arr1[i])
                i += 1
            }

            while j < arr2.count {
                newArray.append(arr2[j])
                j += 1  
            }

            return newArray
        }

        func mergeSort(_ loIdx: Int, _ hiIdx: Int) -> [Int] {
            // base case
            if loIdx == hiIdx {
                return [nums[loIdx]]
            }

            let midIdx = (loIdx + hiIdx) / 2
            let leftHalf = mergeSort(loIdx, midIdx)
            let rightHalf = mergeSort(midIdx + 1, hiIdx)

            return merge(leftHalf, rightHalf)

        }

        return mergeSort(0, nums.count-1)
    }
}

/*

merge sort ... divide and conquer

     0 1 2 3 4 5 6 7
    [9,8,1,1,2,3,1]

    [9,8,1,1]         [2,3,1]

    [9 8] [1,1]       [2 3] [1]

    [9] [8] [1] [1]

    [8 9]  [1 1]

    [1 1 8 9]

*/
