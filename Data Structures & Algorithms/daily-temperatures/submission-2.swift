class Solution {

    /*

    breakdown
    - return array where each idx is the # of days until a warmer day happens, 0 otherwise
    
    [34, 33, 32, 35, 22]
        [3, 2, 1, 0, 0]

    [44]
        [0]

    approach
        - brute force O(N^2): initialize result array with 0, find any bigger num and set result[i] to the difference in their idx 
        - 
    
    */


    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: temperatures.count)

        for i in 0..<temperatures.count {
            let currentTemp = temperatures[i]
            for j in i..<temperatures.count {
                let nextTemp = temperatures[j]

                if nextTemp > currentTemp {
                    result[i] = j - i
                    break
                }
            }
        }

        return result
    }
}
