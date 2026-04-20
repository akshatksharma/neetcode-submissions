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
    - doesn't matter if we do dfs or bfs
    - go through all treenodes and flip l and r pointers 
        O(N) time and space
    - edge cases
        empty tree
        one sided tree 

        A
      C       B
         D

    */

    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard var root else { return root }

        let leftChild = root.left
        root.left = root.right
        root.right = leftChild

        invertTree(root.left)
        invertTree(root.right)

        return root
    }
}
