class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }

        var sortedIntervals = intervals.sorted { $0[0] < $1[0] } // sort by start
        var currentInterval = sortedIntervals[0]
        var mergedIntervals = [[Int]]()

        for i in 1..<sortedIntervals.count {
            let nextInterval = sortedIntervals[i]

            if nextInterval[0] <= currentInterval[1] {
                currentInterval = [currentInterval[0],  max(currentInterval[1], nextInterval[1])]
            } else {
                mergedIntervals.append(currentInterval)
                currentInterval = nextInterval
            }
        }

        // add the end
        mergedIntervals.append(currentInterval)

        return mergedIntervals
    }
}

/*
- can intervals be empty? -> no, at least 1
- can they be given in any order -> yes

[[1,3],[2,6],[8,10],[15,18]]

1 --- 3
   2 ---------6
                   8------10
                               15------18


currentInterval 15-18 

intervals = [1-6  8-10  15-18]



 [[1,7],[2,6],[8,10],[15,18]]

1 ------------------------------ 7 
   2 ---------6
                   8------10
                               15------18


4,10 1,3
                4 ----------------- 10
    1 ----- 4


approach
    - if only 1 item, return that
    - sort by ascending start  O(NlogN)
    - then go item by item and merge if upcoming start is less than current interval end O(N)




*/