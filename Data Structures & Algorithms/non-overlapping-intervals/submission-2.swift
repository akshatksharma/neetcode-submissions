class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 1 else { return 0 }

        var sortedIntervals = intervals.sorted { $0[1] < $1[1] }
        var currentInterval = sortedIntervals[0]
        var numOverlaps = 0

        for i in 1..<sortedIntervals.count {
            let nextInterval = sortedIntervals[i]

            if nextInterval[0] < currentInterval[1] {
                numOverlaps += 1
            } else {
                currentInterval = nextInterval
            }
        }

        return numOverlaps
    }
}
