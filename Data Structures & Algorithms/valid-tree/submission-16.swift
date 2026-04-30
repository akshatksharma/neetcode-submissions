class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        let unionFind = UnionFind(Array(0..<n))

        for edge in edges {
            if !unionFind.union(edge[0], edge[1]) {
                return false
            }
        }

        return unionFind.components == 1
    }

    class UnionFind {
        private(set) var roots: [Int: Int]
        private(set) var ranks: [Int: Int]
        private(set) var components: Int

        init(_ nodes: [Int]) {
            var roots = [Int: Int]()
            nodes.forEach {
                roots[$0] = $0
            }
            self.roots = roots

            var ranks = [Int: Int]()
            nodes.forEach {
                ranks[$0] = 0
            }
            self.ranks = ranks
            self.components = nodes.count
        }

        func find(_ node: Int) -> Int {
            guard let root = roots[node], root != node else { return node }
            roots[node] = find(root)
            return roots[node]!
        }

        func union(_ node1: Int, _ node2: Int) -> Bool {
            let root1 = find(node1)
            let root2 = find(node2)

            if root1 == root2 {
                return false
            } else if ranks[root1]! > ranks[root2]! {
                roots[root1] = root2
                ranks[root2, default: 0] += 1
            } else {
                roots[root2] = root1
                ranks[root1, default: 0] += 1
            }

            components -= 1

            return true
        }

    }
}


