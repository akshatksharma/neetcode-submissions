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
        look for ways to search through tree

        if the node is greater than both then we need to search left
        if node is less than both then we need to search right

        if the node is in between both (closed boundary) then we're at the LCA

        edge cases
            - tree can't be nil
            - p and q have to be in there

    */

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root, let p, let q else { return nil } // double check this
        
        if root.val > max(p.val, q.val) {
            return lowestCommonAncestor(root.left, p, q)
        } else if root.val < min(p.val, q.val) {
            return lowestCommonAncestor(root.right, p, q)
        } else {
            return root
        }

        // if root.val > p.val && root.val > q.val {
        //     return lowestCommonAncestor(root.left, p, q)
        // } else if root.val < p.val && root.val < q.val {
        //     return lowestCommonAncestor(root.right, p, q)
        // } else if (root.val >= q.val && root.val <= p.val) || (root.val <= q.val && root.val >= p.val) {
        //     return root
        // }

        // return root
    }
}
