class Solution {

    /*

    breakdown
    - return array where each idx is the # of days until a warmer day happens, 0 otherwise
    
    [34, 33, 32, 35, 22]
        [3, 2, 1, 0, 0]

    [34, 33, 35, 36, 22]

    [44]
        [0]

    approach
        - brute force O(N^2) time: 
            initialize result array with 0
            find any bigger num and set result[i] to the difference in their idx 
            break when we find a bigger num
        - scan O(N) time and O(N) space: 
            as we go through the array, we can store all the numbers we might need to update in a stack
                if the num is smaller, we add tuples to stack (num, idx)
                if its bigger, we start popping from stack and update result arrays
    */


    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: temperatures.count)
        guard !temperatures.isEmpty else { return result }

        var stack: [(Int, Int)] = [(temperatures[0], 0)]

        for i in 0..<temperatures.count {
            let currentTemp = temperatures[i]

            while var (lastTemp, lastTempIdx) = stack.last, currentTemp > lastTemp {
                result[lastTempIdx] = i - lastTempIdx
                _ = stack.popLast()
            }

            stack.append((currentTemp, i))
        }

        return result
    }
}
