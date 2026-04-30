class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        let unionFind = UnionFind(n)

        for edge in edges {
            _ = unionFind.union(edge[0], edge[1])
        }

        return unionFind.numComponents
    }

    /*
        edges are from 0..<n
        duplicate edges -> no
        can we have cycles? -> yes

        build a union find and run union on the edge pairs and count the number of components remaining
            as we merge, if we don't create a cycle, we know that decrease the # of components from the max 
            possible number, n
            if we create a cycle then we don't decrease
        
    */

    class UnionFind {
        private(set) var root: [Int]
        private(set) var size: [Int]
        private(set) var numComponents: Int

        init(_ numNodes: Int) {
            self.root = Array(0..<numNodes)
            self.size = Array(repeating: 1, count: numNodes)
            self.numComponents = numNodes
        }

        func find(_ node: Int) -> Int {
            if node == root[node] {
                return node
            }

            root[node] = find(root[node])

            return root[node]
        }

        func union(_ node1: Int, _ node2: Int) -> Bool {
            let root1 = find(node1)
            let root2 = find(node2)
            
            if root1 == root2 {
                return false
            } else if size[root1] > size[root2] {
                root[root2] = root1
            } else if size[root2] > size[root1] {
                root[root1] = root2
            } else {
                root[root1] = root2
                size[root2] += 1
            }

            numComponents -= 1
            return true
        }

    }
}
