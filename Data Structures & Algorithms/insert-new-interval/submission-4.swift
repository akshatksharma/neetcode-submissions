class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var intervals = intervals
        intervals.append(newInterval)
        var unmergedIntervals = intervals.sorted { $0[0] < $1[0] } // NlogN

        var mergedIntervals = [[Int]]()
        var currentInterval = unmergedIntervals[0]

        for i in 1..<unmergedIntervals.count {
            let nextInterval = unmergedIntervals[i]
            let nextStart = nextInterval[0]
            let nextEnd = nextInterval[1]

            let currentStart = currentInterval[0]
            let currentEnd = currentInterval[1]

            if nextStart <= currentEnd {
                currentInterval = [currentStart, max(nextEnd, currentEnd)]
            } else {
                mergedIntervals.append(currentInterval)
                currentInterval = nextInterval
            }
        }

        mergedIntervals.append(currentInterval)

        return mergedIntervals
    }
}

/*
    start,end of ith interval --- sorted by ascending start and NON overlapping
    new interval needs to be inserted and kept non overlapping

    questions
        how many intervals in intervals? -> could have 0
        new interval will always be non empty

    
    approach
        - intervals is already sorted 
        - we need to find where to put our new interval, then merge as needed


        brute force
            - find place
                walk down array til newInterval.start > interval i.start, insert it ... O(N)
            - then merge into new array 
                maintain a currentInterval, initialized at first interval (need to handle empty case, 1 case)
                if next interval start is less than currentInterval end, then update currentInterval
                if not, then append currentInterval and set currentInterval to the new one

                we could merge all N intervals in intervals, total O(N) time

        optimized



    examples
    [[1,3],[4,6]]
    adding [2,5]

    1,3   2,5   4,6

    1 ---- 3  4 --- 6
        2--------5

    -> [1,6]


    1,7  2,5   8,10

    -> 1,7   8,10


    []
    adding [2,5]

    -> [2,5]


*/
