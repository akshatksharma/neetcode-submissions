/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

import Collections

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var serialized: [String] = [] // we have init value so we basically 1 index it

        var deque = Deque<TreeNode?>()
        deque.append(root)

        while !deque.isEmpty {
            let level = deque.count
            for i in 0..<level {
                let node = deque.popFirst()

                // only want insert non nil nodes into deque
                if let node, let validNode = node {
                    serialized.append("\(validNode.val)")
                    deque.append(validNode.left)
                    deque.append(validNode.right)
                } else {
                    serialized.append("#")
                }
            }
        }

        return serialized.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let dataArray = data.split(separator: ",")

        guard let rootVal = Int(dataArray[0]) else {
            return nil // empy data
        } 

        var deque = Deque<TreeNode>()
        var root = TreeNode(rootVal)
        deque.append(root)

        var childIdx = 1

        while !deque.isEmpty, childIdx < dataArray.count {
            var node = deque.popFirst()

            if let val = Int(dataArray[childIdx]) { // i.e is not a #
                let leftNode = TreeNode(val)
                node?.left = leftNode
                deque.append(leftNode)
            }

            childIdx += 1

            if let val = Int(dataArray[childIdx]) { // i.e is not a #
                let rightNode = TreeNode(val)
                node?.right = rightNode
                deque.append(rightNode)
            }

            childIdx += 1

        }

        return root
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))

/*
                    1
            2               3

              5


        0 1 2 3 4 5 6
          1 2 3 # 5 # # 

        serialize: 
            we can serialize this like a heap ... for an index i (starting at 1)
                left child is at 2i, right is at 2i+1
                if we have nil at a place, we put a # there instead

                we can do this via a level order traversal with BFS - O(n) ... technically we store more 
                than the # of nodes, but its still asymptotically O(n)
                    issue is that this is pretty inefficent for sparse trees i.e ones that have lots of nils

                    time: O(n)
                    space: excluding output array, we should only be holding
                    at most all the nodes in the leaf nodes, which is n/2 for a 
                    full tree (which we have since we are counting nils as #)
                        so O(n)
        deserialize
          # 1 2 3 # 5 # #  

            split by commas
            from i 1 .. end
                make nodes for each non nil and map index to node

            from i 1..end
                grab node from map
                set node.left = 2i
                set node.right to 2i+1

            O(n) time where n is the # of nodes encoded within the string
            O(n) space since we're making a map of every node to idx


*/
