import Collections

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        // state we maintain
            // heap has frequencies of elements
            // queue has tuples of frequencies and time until we can use
            // time helps us know when we can pull fom queue
        var freqHeap = Heap<Int>()
        var cooldownQueue = Deque<(Int,Int)>()
        var time = 0

        // load heap
        var freqMap = [Character: Int]()
        for task in tasks {
            freqMap[task, default: 0] += 1
        }
        for freq in freqMap.values {
            freqHeap.insert(freq)
        }

        /*
        [X X Y X Y Z Z ] n = 2
        [X Y Z X Y Z X]

        ans: 3
        time: 5
        heap: {}
        queue: {(2,5)(1,6)(1,7)}

        */

        // pull from heap, maintain state 
        while !freqHeap.isEmpty || !cooldownQueue.isEmpty {
            time += 1

            if let nextItemFreq = freqHeap.popMax() {
                let remainingFreq = nextItemFreq - 1
                if remainingFreq > 0 {
                    let nextUsableTime = time + n
                    cooldownQueue.append((remainingFreq, nextUsableTime))
                }
            }

            while let earliestCooldown = cooldownQueue.first, earliestCooldown.1 - time == 0 { // while or let?
                _ = cooldownQueue.popFirst()
                freqHeap.insert(earliestCooldown.0)
            }

            while freqHeap.isEmpty, let earliestCooldown = cooldownQueue.first, earliestCooldown.1 - time > 0 { // we have extra time and heap empty
                _ = cooldownQueue.popFirst()
                time = earliestCooldown.1
                freqHeap.insert(earliestCooldown.0)
            }   
        }

        return time
    }
}

/*
    CHECKLIST
    - check n = 0 case
    - check n = 5







    tasks[i] : uppercase A-Z 
    n : int
    
    each cpu completes one task, can be done in ANY order
    identical(?) tasks must be separated by n cycles

    min cycles to complete all tasks

    examples
    [X X Y Y], n = 2 

        X Y _ X Y -> 5



    [X X X X] n = 2

        X _ _ X _ _ X _ _ X -> 10



    [X X Y X Y] n = 2

    X _ X _ Y _ X _ Y
    X Y X Y X


    can we order these to make it easier?


    brute force
        upper bound on answer = tasks.count + (n-1 * tasks.count-1)

    optimized : heap + queue

        [X X Y X Y] n = 2

        ans: 2
        time: 4
        heap: {}
        queue: {(1,3) (1,2)}

*/
