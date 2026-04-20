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
    height of each node is the height of its longest child
    so we need to figure out the height of the children first
    lends me to a dfs like approach

    O(N) time and space 

                    A
                B       D
            C

                
    */

    func maxDepth(_ root: TreeNode?) -> Int {
        guard var root else { return 0 }

        let leftHeight = maxDepth(root.left)
        let rightHeight = maxDepth(root.right)

        return 1 + max(leftHeight, rightHeight)
    }
}
