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

extension Node: Hashable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var nodeMap = [Node?: Node?]()

        /*
        [[3,null],[7,3],[4,0],[5,1]]
        
        {5: [5, null] 4: [4, null] ...  }



        */

        // copy next pointers
        func copyList(_ head: Node?) -> Node? {
            guard let head else { return nil }

            var newNode = Node(head.val)
            newNode.next = copyList(head.next)
            nodeMap[head] = newNode

            return newNode
        }

        var newList = copyList(head)

        var currNewList = newList
        var currList = head
        // set random pointers
        while currNewList != nil && currList != nil { // should be the same length
            if let random = currList?.random, let matchingNode = nodeMap[random] {
                currNewList?.random = matchingNode
            }
            currNewList = currNewList?.next
            currList = currList?.next
        }

        return newList
    }

    /*  


        easiest go backwards from last node (that has .next = nil) recursively
            for each node 
                create a new node
                we copy the value
                we set .next recursively

                hashmap of val to completed node

                return node
            
        then for each node in the new array, we set the we set .random pointers recursively

        overall O(N) time and space
    */
}
