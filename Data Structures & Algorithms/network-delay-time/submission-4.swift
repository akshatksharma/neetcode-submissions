import Collections

class Solution {
    struct Node: Comparable {
        let val: Int
        let time: Int

        init(_ val: Int, _ time: Int) {
            self.val = val
            self.time = time
        }
        
        static func <(_ lhs: Node, _ rhs: Node) -> Bool {
            return lhs.time < rhs.time
        } 
    }   

    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var visited = Set<Int>()
        var maxTime = 0

        var adjList = Array(repeating: [(Int, Int)](), count: n+1) // idx is source -> (destination, weight), idx goes from 1 -> n
        for time in times {
            adjList[time[0]].append((time[1], time[2]))
        }

        var heap = Heap<Node>()
        heap.insert(Node(k, 0))

        while let minNode = heap.popMin() {
            if visited.contains(minNode.val) { // the first time we pop we should set it
                continue
            }

            visited.insert(minNode.val)
            maxTime = minNode.time // max(maxTime, minNode.time)

            let neighbors = adjList[minNode.val]
            for (neighbor, additionalTime) in neighbors {
                if !visited.contains(neighbor) {
                    heap.insert(Node(neighbor, minNode.time + additionalTime))
                }
            }
        }

        if visited.count < n {
            return -1
        } else {
            return maxTime
        }
    }
}

/*

need to travel through graph until we've visited every node we can from the start
    we can run dijkstras algo to get the min distance to every node and track visited
    the max value of this is the time to encounter all node
    
if our visited isn't the size of the graph -> -1
else we return the max value

*/