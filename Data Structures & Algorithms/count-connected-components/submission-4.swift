class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var adjList = Array(repeating: Set<Int>(), count: n)
        var visited = Set<Int>()

        // setup adj list
        for edge in edges {
            adjList[edge[0]].insert(edge[1])
            adjList[edge[1]].insert(edge[0])
        }

        func dfs(_ node: Int) {
            if visited.contains(node) {
                return
            }

            visited.insert(node)
            
            let neighbors = adjList[node]
            for neighbor in neighbors {
                dfs(neighbor)
            }
        }

        // run dfs
        var numComponents = 0
        for node in 0..<n {
            if !visited.contains(node) {
                numComponents += 1
            }
            dfs(node)
        }

        return numComponents
    }


    /*
    lets rip dfs from every node
    the number of times our dfs returns is the number of components

    need to make sure of the particulars of the unconnected approach here work
    */
}