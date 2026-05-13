import Collections

class KthLargest {
    private var heap: Heap<Int>
    private let k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.heap = Heap<Int>()
        self.k = k

        for num in nums {   
            if heap.count < k {
                heap.insert(num)
            } else if let min = heap.min, min <= num {
                _ = heap.popMin()
                heap.insert(num)
            }
        }
    }

    func add(_ val: Int) -> Int {
        if heap.count < k {
            heap.insert(val)
        } else if let min = heap.min, min <= val {
            _ = heap.popMin()
            heap.insert(val)
        }

        return heap.min ?? val
    }

    /*
    [1, 2, 4, 4, 3, ...], k = 3 -> 2

    when it comes to maintaining a sorted array, we could just use an array, but 
    then we need to find the right position for each upcoming value, which would take O(n)

    so for k elements, this is O(k^2) (for k elements we worst case do k re-sorts) 

    the better data structure for this would be a heap ... we could maintain a minheap of size k
    for every val in the array, if the value is greater than our min, we pop the min and add the value
    so we'll end up with the k largest elements in the array, sorted in min order ... the min is the kth element

    

    3 4 4

    */
}


/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */