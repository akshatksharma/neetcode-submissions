class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var mergedIntervals = [[Int]]()
        var i = 0

        // add everything before
        while i < intervals.count, intervals[i][1] < newInterval[0] {
            mergedIntervals.append(intervals[i])
            i += 1
        }

        // merge
        var mergingInterval = newInterval
        while i < intervals.count, intervals[i][0] <= mergingInterval[1] {
            mergingInterval = [min(mergingInterval[0], intervals[i][0] ), max(mergingInterval[1], intervals[i][1])]
            i += 1
        }
        mergedIntervals.append(mergingInterval)

        // add everything after
        while i < intervals.count {
            mergedIntervals.append(intervals[i])
            i += 1
        }

        return mergedIntervals
    }
}