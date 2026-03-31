class Solution {

    /*
    breakdown
    - empty array -> []
    - single item -> [x]
    - more than one answer? (i.e 2 things have max freq) -> not possible
    - not an answer? (i.e k = 2 but there's only 1 kind of item) -> not possible

    [1, 3, 3, 2, 3, 2]

    [1, 2, 2, 3, 3, 3]

    [
    1: 1
    3: 3
    2: 2
    ]

    could sort the map based on the count, we'll have at most 2000 keys so this sort 
    doesn't scale w the input

    */

    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqMap: [Int: Int] = [:]

        nums.forEach {
            freqMap[$0, default: 0] += 1
        }

        let sortedFreqMap = freqMap.sorted { $0.value > $1.value }

        return Array(sortedFreqMap[0..<k]).map { $0.key }
    }
}
