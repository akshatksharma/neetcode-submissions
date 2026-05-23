/**
 * Definition of Interval:
 * class Interval {
 *     var start: Int
 *     var end: Int
 *     init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

 import Collections

class Solution {
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        guard intervals.count > 0 else { return 0 }
        guard intervals.count > 1 else { return 1 }

        var sortedIntervals = intervals.sorted { $0.start < $1.start }

        var heap = Heap<Int>()
        heap.insert(sortedIntervals[0].end) // add the first item

        for i in 1..<sortedIntervals.count {
            let nextInterval = sortedIntervals[i]

            if let nextAvailMeetingEnd = heap.min, nextInterval.start < nextAvailMeetingEnd {
                heap.insert(nextInterval.end)
            } else {
                _ = heap.popMin()
                heap.insert(nextInterval.end)
            }
        }

        return heap.count
    }
}


/*
    questions
        - can have 0 intervals
        - not in sorted order 

    approach
        we can build from the start
        we need to always consider the room with the earliest opening 
            heaps are good at that, we could have a heap that keeps the soonest finishing
            meeting

        heap stores rooms ending times
            when a meeting overlaps with soonest ending meeting, we add it to heap since we need a new room
            when it doesn't, we remove the top value and update it with the new one (we know the new meeting must be ending after the existing one since we sorted it by start time and the end time of each meeting must be after it's start time)

        return heap's length

    examples

        [(0,40),(5,10),(15,20)]

            0 --------------- 40
                5--10
                    15--20

        [(0,20),(5,10),(15,30),(21,35)]

            0 -------------- 20
                       15 ------------- 30
                5 -- 10
                        
                                21 ---------- 35

            [30, 35]


        time: O(NlogN) -> O(N) x (O(logN) + O(1))
        space: O(N)

*/