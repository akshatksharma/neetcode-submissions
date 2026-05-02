class Solution {
    class UnionFind {
        private var nodeToRoot: [Int] // value at index i is root of index i
        private var rank: [Int] // value at index i gives rank of root i

        init(_ n: Int) {
            self.nodeToRoot = Array(0..<n)
            self.rank = Array(repeating: 1, count: n)
        }

        func find(_ node: Int) -> Int {
            guard nodeToRoot[node] != node else { return node }
            nodeToRoot[node] = find(nodeToRoot[node]) // path compression
            return nodeToRoot[node]
        }

        func union(_ nodeA: Int, _ nodeB: Int) -> Bool {
            let rootA = find(nodeA)
            let rootB = find(nodeB)

            guard rootA != rootB else { return false } // cycle

            if rank[rootA] > rank[rootB] {
                nodeToRoot[rootB] = rootA
            } else if rank[rootB] > rank[rootA] {
                nodeToRoot[rootA] = rootB
            } else {
                nodeToRoot[rootA] = rootB
                rank[rootA] += 1
            }

            return true
        }
    }

    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let unionFind = UnionFind(edges.count+1) // 0..n+1 so we can index 1..n

        for edge in edges {
            let causedCycle = !unionFind.union(edge[0], edge[1])
            if causedCycle {
                return edge
            }
        }

        return []
    }

    /*
        instead of pulling edges, we could build up edges and see what makes us have a cycle
        a UnionFind is perfect for this, we could merge edges until we get one that leads us
        merging 2 nodes that already share a common root (aka same component)

        bc we want the last in the edges input, we can build up the nodes from the end of the array

        Time
        O(E * f(a)) -> O(E) (merging edges)
        Space: O(V) (storing all nodes)
    */
}
