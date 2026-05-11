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

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var serialized = [String]()

        func dfs(_ node: TreeNode?) {
            // base cases
            guard let node else {
                serialized.append("#")
                return
            }

            serialized.append("\(node.val)")

            dfs(node.left)
            dfs(node.right)
        }

        dfs(root)

        return serialized.joined(separator: ",")
    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        let dataArray = data.split(separator: ",")

        var idx = 0 
        func recurse() -> TreeNode? {
            // base cases
            guard idx < dataArray.count,
                  let nodeVal = Int(dataArray[idx]) 
            else { return nil }

            let node = TreeNode(nodeVal)

            idx += 1
            node.left = recurse()

            idx += 1
            node.right = recurse()

            return node
        }

        return recurse()
    }


    /*

        serialize -> encode preorder traversal via dfs, include null children
            time: O(N) space: O(N) (call stack)

                1
            2         3

                  4       5

                            i
        1 2 # # 3 4 # # 5 # # 


        deserialize -> we recursively create nodes while tracking index in array
            time: O(N) space: O(N) (call stack)
        
        i
        1 2 # # 3 4 # # 5 # # 

                1

            2       3

                 4

        

    */
}
