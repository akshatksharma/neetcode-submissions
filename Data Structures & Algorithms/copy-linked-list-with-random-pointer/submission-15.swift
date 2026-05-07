/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head else { return nil }
        
        var oldToCopy = [Node?: Node?]()

        var curr: Node? = head
        while let node = curr {
            let newNode = Node(node.val)
            oldToCopy[node] = newNode
            curr = node.next
        }

        curr = head
        while let node = curr, let newNode = oldToCopy[node] {
            if let nextNode = node.next, 
                let newNext = oldToCopy[nextNode] {
                newNode?.next = newNext
            }
            if let randomNode = node.random, 
                let newRandom = oldToCopy[randomNode] {
                newNode?.random = newRandom
            }

            curr = node.next
        }

        return oldToCopy[head]!
    }
}

extension Node: Hashable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

