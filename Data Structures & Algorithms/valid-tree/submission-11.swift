class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var adjList = [Int: Set<Int>]()
        var visited = Set<Int>()

        // build adjList
        for node in 0..<n {
            adjList[node] = Set<Int>()
        }
        for edge in edges {
            adjList[edge[0], default: Set<Int>()].insert(edge[1])
            adjList[edge[1], default: Set<Int>()].insert(edge[0])
        }
        // dfs
        func dfs(_ node: Int, _ parent: Int) -> Bool {
            if visited.contains(node) {
                return false
            }

            visited.insert(node)

            let neighbors = adjList[node]!

            for neighbor in neighbors {
                if neighbor == parent {
                    continue
                }    
                if !dfs(neighbor, node) {
                    return false
                }
            }

            return true
        }

        // run dfs
       let hasCycle = !dfs(0, -1)

        return !hasCycle && visited.count == n
    }


    /*
        tree == no cycles?

        1. make a adjlist
            need to add edges for both pairs
        2. run dfs / kahn's and look for cycles, return false if cycle
        3. return true if no cycles

    */
}
