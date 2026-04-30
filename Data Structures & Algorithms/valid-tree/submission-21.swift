class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        let unionFind = UnionFind(n)

        for edge in edges {
            if !unionFind.union(edge[0], edge[1]) {
                return false
            }
        }

        return unionFind.components == 1
    }

    class UnionFind {
        private(set) var roots: [Int]
        private(set) var ranks: [Int]
        private(set) var components: Int

        init(_ numNodes: Int) {
            self.roots = Array(0..<numNodes)
            self.ranks = Array(repeating: 1, count: numNodes)
            self.components = numNodes
        }

        func find(_ node: Int) -> Int {
            guard roots[node] != node else { return node }

            roots[node] = find(roots[node]) // path compression

            return roots[node]
        }

        func union(_ node1: Int, _ node2: Int) -> Bool {
            let root1 = find(node1)
            let root2 = find(node2)

            if root1 == root2 {
                return false
            } else if ranks[root1] < ranks[root2] {
                roots[root1] = root2
            } else if ranks[root1] > ranks[root2] {
                roots[root2] = root1
            } else {
                roots[root1] = root2
                ranks[root1] += 1
            }

            components -= 1

            return true
        }

    }
}


