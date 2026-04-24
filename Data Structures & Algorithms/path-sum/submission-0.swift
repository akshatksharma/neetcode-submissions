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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root else { return false }

        if root.left == nil && root.right == nil {
            return root.val == targetSum
        } else {
            return hasPathSum(root.left, targetSum - root.val)
                   || hasPathSum(root.right, targetSum - root.val)
        }
    }

    /*
     try all paths from root to leafs 
        for each step in the path, if not a leaf, return the val of calling hasPathSum with targetSum - val
        when we reach a leaf, see if the val of the node == targetSum, if so return true, else false
        we shouldn't go into nil values
         
    */
}
