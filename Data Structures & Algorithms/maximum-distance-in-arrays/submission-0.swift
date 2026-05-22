class Solution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        let firstArray = arrays[0]
        var globalMax = firstArray[firstArray.count - 1]
        var globalMin = firstArray[0]

        var globalMaxDistance = 0

        for i in 1..<arrays.count {
            let currArray = arrays[i]
            let currMax = currArray[currArray.count - 1]
            let currMin = currArray[0]
            let currMaxDistance = max(abs(currMax - globalMin), abs(globalMax - currMin))

            globalMaxDistance = max(globalMaxDistance, currMaxDistance)
            globalMax = max(globalMax, currMax)
            globalMin = min(globalMin, currMin)
        }

        return globalMaxDistance
    }
}

/*

        [-3,1,2,3]
        [-3,-2,1]
        [0]

            globalMax: 3
            globalMin: -3
            globalDistance = 6

        [1,1]
        [1,1]

            globalMax: 1
            globalMin: 1
            globalDistance = 0


        [0]
        [-200]

            globalMax: 0
            globalMin: 0
            globalDistance = 200




    - m arrays in ASCENDING ORDER
    - difference between 2 elems in array is abs val of values



    questions
    - can we have negatives? -> Yes
    - duplicates? -> Yes
    - can any array be empty? -> At least 1 elem
    - how many arrays do we have? -> At least 2
    - the value has to be between 2 different arrays? -> yes



        the max distance is the largest value across all the arrays - smallest value across all the arrays

        brute force


        iterate through
            we maintain and global min and max, initialized at the first array
            for every other array, we subtract the max from the stored min, and the stored max from the min and see if our distance is larger
            we update our min and max
            by the end we'll have our value


        divide and conquer
            we can get the min and max of each array in O(1)
            finding the max distance across 2 arrays is O(1)

            what if we did a divide and conquer style approach?

            find the max distance between 2 arrays, and then and then pass the
            numbers that got you there upwards


                    arr1, arr2, arr3

                arr1 arr2           arr3
                  -> [min(arr1,arr2), max(arr1,arr2)]       -> [arr3[0], arr3[arr3.count-1]]

                            ^ not quite the min / max but actually
                                the values that give the largest difference
                                ... we don't want them to be in the same array

                    

                This would take logn time ... it takes O(logn) to break
                an array of size n into elements of size 1 ... and then at 
                that point we do O(1) work

*/
