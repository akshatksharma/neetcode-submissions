/*
Definition for a Node.
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
*/

class Solution {
    /*
        1 - 2 - 3
        1|[2]
        2|[1, 3]
        3|[2]

        1 - 2 
        \ 3 /

        1 |[2, 3]
        2 |[1, 3]
        3 |[1, 2]

        make a new node for the current node
        add it to visited
        copy the currentNode's val property to newNode
        for each neighbor in currentNode's neighbors property
            if we already visited it, append it
            else recurse onto the neighbor and use that node
            append the new node to newNode's neighbors
    */

    func cloneGraph(_ node: Node?) -> Node? {
        guard let node else { return nil}

        var visited = [Int: Node]() // map node vals to node

        func dfs(_ node: Node) -> Node {
            var newNode = Node(node.val)
            visited[newNode.val] = newNode

            for neighbor in node.neighbors {
                guard let neighbor else { continue }
                if let cachedNeighbor = visited[neighbor.val] {
                    newNode.neighbors.append(cachedNeighbor)
                } else {
                    newNode.neighbors.append(dfs(neighbor))
                }
            }

            return newNode
        }

        return dfs(node)
    }
}
