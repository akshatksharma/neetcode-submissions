import Collections

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>()

        for num in nums {
            if heap.count < k {
                heap.insert(num)
            } else {
                if let min = heap.min, num > min { // if we have a large value coming, 
                    _ = heap.popMin()
                    heap.insert(num)
                }
            }
        }

        return heap.min! // amongst k largest values, the kth largest is the min

        /*
            2 3 1 5 5 5 4  | k = 2

            [5 5] 
        */
    }
}
