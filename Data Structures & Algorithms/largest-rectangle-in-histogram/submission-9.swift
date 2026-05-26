class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [(startIdx: Int, height: Int)]()
        var maxArea = 0

        for (idx, height) in heights.enumerated() {
            var validStartIdx = idx

            while let (lastHeightStartIdx, lastHeight) = stack.last, height < lastHeight {
                _ = stack.popLast()
                let width = (idx-1) - (lastHeightStartIdx) + 1
                let area = lastHeight * width
                maxArea = max(maxArea, area)

                validStartIdx = lastHeightStartIdx
            }
            stack.append((startIdx: validStartIdx, height: height))
        }

        for (startIdx, height) in stack {
            let area = height * (heights.count - startIdx)
            maxArea = max(maxArea, area)
        }

        return maxArea
    }

    /*
        heights i = height of bar, each has width 1 .
        largest rectangle amongst all the bars

        qs/ edge cases 
        - heights can be 0? -> YES
        - duplicate heights
        - can we have 0 heights? -> NO

        - can it be a rectangle if 


        1 3 4 4 4
        XX    
        XXX   
        XX  
        X
        X

        (2,0) (3,1)
            calc area as min(2,3) * ((1-0) + 1) = 4
            hashmap[2] = 4
        (2,0)| (2,2)
            calc area as min(2,2) * (2-0 + 1) + hashmap[0] = 6 + 0
            hashmap[3] = 6
        (1,3)
            we want to be able to calc area as 4
                if we knock out all elements in the stack, we compare to idx=0
                (1) * (3-0+1) = 4
                hashmap[4] = 4
        (1,3) (1,4)
            we want to be able to calc as 5
                area between 3 and 4 = 1
                how do we remember that the area of (1,3) is 3
                    hashmap ... stores the largest height ending at i (i=0 == 0)

        ------------

        within a given range, we're bounded by the smallest height 

        brute force: try all N^2 subarrays, see the area for each and track largest
            time: O(N^2) there's N amortized time work
            space: O(1)

        optimized:
            q is what subarrays can we discard
            we can't get rid of smaller heights since we might be bounded by them
            in a wider approach
    */
}
