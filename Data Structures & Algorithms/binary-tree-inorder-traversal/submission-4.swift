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
        var ans = [Int]()
        dfs(root, &ans)
        return ans
    }


    func dfs(_ root: TreeNode?, _ order: inout [Int]) {
        guard let root else { return }
        dfs(root.left, &order)
        order.append(root.val)
        dfs(root.right, &order)
    }
}
