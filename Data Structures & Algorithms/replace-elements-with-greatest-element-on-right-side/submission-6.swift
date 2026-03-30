class Solution {
    /*
        brute force is finding the max num for each num, and doing the replace
            the replace is constant, but we need to search each item for each item,
            so it scales n^2
        
        we can instead build up the max num by iterating from the other side...
        at any given position, the max num is the max of the current max num and the next
        number in the array

        NOTE TO SELF: try changing order of iteration to find ways to build patterns
    */

    func replaceElements(_ arr: [Int]) -> [Int] {
        var out = arr
        var currMax = -1

        for i in stride(from: arr.count - 1, through: 0, by: -1) {
            out[i] = currMax // filling up the array backwards too
                             // also doing this before the update step below (for currMax) is important 
            currMax = max(currMax, arr[i])
        }

        // for (idx, num) in arr.reversed().enumerated() {
        //     out[arr.count - 1 - idx] = currMax
        //     currMax = max(num, currMax)
        // }

        return out
    }
}
