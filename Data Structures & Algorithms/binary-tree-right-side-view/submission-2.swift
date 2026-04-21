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

class Solution {

    /*
    - empty tree -> yes


        A
    C        B
        D

        _
    */


    func rightSideView(_ root: TreeNode?) -> [Int] {
        var queue = [TreeNode]()
        var ans = [Int]()

        guard let root else { return [] }

        queue.append(root)

        while !queue.isEmpty {
            let level = queue.count

            var i = 0
            while i < level {
                let node = queue.removeFirst()
                
                if i == level - 1 {
                    ans.append(node.val)
                }

                if let leftNode = node.left {
                    queue.append(leftNode)
                }

                if let rightNode = node.right {
                    queue.append(rightNode)
                }

                i += 1
            }
        }

        return ans
    }
}
