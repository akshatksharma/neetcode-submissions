import Collections

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        guard stones.count > 1 else { return stones[0] } // only one stone, return it

        var heap = Heap<Int>()

        /*
        [2,3,6,2,4]

            [1]

        */

        // add all stones
        for stone in stones {
            heap.insert(stone) // nlogn
        }

        // simulate smashing until we have <= 1 stones
        while heap.count > 1 { // n times
            let largestStone = heap.popMax()! // logn
            let secondLargestStone = heap.popMax()! // logn

            let remainingStone = abs(largestStone - secondLargestStone)

            if remainingStone > 0 {
                heap.insert(remainingStone) // logn
            }
        }

        // return top value in heap (or 0)
        if heap.isEmpty {
            return 0
        } else {
            return heap.max ?? 0
        }
    }
}


/*

questions
- how many stones -> at least one
- we stop when we have one stone


*/
