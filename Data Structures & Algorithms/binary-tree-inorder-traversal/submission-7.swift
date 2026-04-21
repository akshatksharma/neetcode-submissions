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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var order = [Int]()

        func dfs(_ root: TreeNode?) {
            guard let root else { return }
            dfs(root.left)
            order.append(root.val)
            dfs(root.right)
        }

        dfs(root)
        return order
    }
}
