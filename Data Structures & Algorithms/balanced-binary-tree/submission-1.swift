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
    func isBalanced(_ root: TreeNode?) -> Bool {
        func dfs(_ root: TreeNode?) -> (Bool, Int) {
            // base cases
            guard let root else { return (true, 0) }

            // get child heights
            let (leftIsBalanced, leftHeight) = dfs(root.left)

            if !leftIsBalanced {
                return (false, 0)
            }

            let (rightIsBalanced, rightHeight) = dfs(root.right)

            if !rightIsBalanced {
                return (false, 0)
            }

            let isBalanced = abs(leftHeight - rightHeight) <= 1
            let maxHeight = 1 + max(leftHeight, rightHeight)
            return (isBalanced, maxHeight)
        }

        let (isBalanced, _) = dfs(root)

        return isBalanced
    }
}
