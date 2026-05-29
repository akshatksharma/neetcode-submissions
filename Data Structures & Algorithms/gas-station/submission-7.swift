class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        /*
            gas = 5

               i
            [2,3]
            [1,1]

        */

        let numStations = gas.count
        
        func canCompleteCircuitImpl(from startIdx: Int) -> Bool {
            var currentGas = 0
            var currentStation = startIdx
            var steps = 0

            while steps < numStations {
                currentGas += gas[currentStation] - cost[currentStation]

                if currentGas < 0 {
                    return false
                }

                currentStation = (currentStation + 1) % numStations
                steps += 1
            }

            return true
        }

        for start in 0..<numStations {
            if canCompleteCircuitImpl(from: start) {
                return start
            }
        }

        return -1
    }
}

/*

    gas: [1,2,3,4]
   cost: [2,2,4,1]


    able to travel == positive gas after our cost 


    gas = [1,2,3]
   cost = [2,3,2]

    
*/
