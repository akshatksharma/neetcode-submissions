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

class Solution {
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {
        guard intervals.count > 1 else { return true }

        var sortedIntervals = intervals.sorted { $0.start < $1.start  }
        var currentInterval = sortedIntervals[0]

        for i in 1..<sortedIntervals.count {
            let nextInterval = sortedIntervals[i]

            if nextInterval.start < currentInterval.end {
                return false
            } else {
                currentInterval = nextInterval
            }
        }

        return true
    }
}

/*

all meetings without any conflicts ... i.e no overlaps

intervals length? -> can have 0
can have duplicates? -> yes
in sorted order? -> no

    [(0,30),(5,10),(15,20)]

    0 ------------------ 30
        5 -- 10
                 15---20



    [(0,5),(5,10),(15,20)]

    0 --- 5
          5 -- 10
                  15---20


    [(0,5),(5,10),(9,20)]

    0 --- 5
          5 -- 10
              9---------20


    [20]


    []

*/