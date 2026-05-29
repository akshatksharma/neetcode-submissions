class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        /*
            gas = 5

               i
            [2,3]
            [1,1]

        */
        
        func canCompleteCircuitImpl(from startIdx: Int) -> Bool {
            var currentGas = gas[startIdx]
            var currentStation = startIdx
            var nextStation = (startIdx + 1) % gas.count

            // handle first trip
            currentGas -= cost[currentStation]
            if currentGas < 0 {
                return false
            }
            currentGas += gas[nextStation]
            currentStation = (currentStation + 1) % gas.count

            // handle the rest
            while currentStation != startIdx {
                currentGas -= cost[currentStation]

                if currentGas < 0 {
                    return false
                }

                nextStation = (currentStation + 1) % gas.count
                currentGas += gas[nextStation]

                currentStation = (currentStation + 1) % gas.count
            }

            return true
        }

        var i = 0
        while i < gas.count {
            if canCompleteCircuitImpl(from: i) {
                return i
            }
            
            i += 1
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
