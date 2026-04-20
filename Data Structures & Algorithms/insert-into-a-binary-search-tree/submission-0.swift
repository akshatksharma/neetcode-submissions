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
    we basically need to search for the position that the node should be, and then return it

    we're essentially knocking out half the tree each time, if the tree is balanced, then that's half of the tree each time
    so we're halfing n each time, all the way to 1 ... that takes logn operations

    if tree not balanced this is closer to O(n) since its basically like w're going through a linked list

    insert 3
                5
            2       8

    */

    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard var root else { return TreeNode(val) }

        if val > root.val {
            root.right = insertIntoBST(root.right, val)
        } else {
            root.left = insertIntoBST(root.left, val)
        }

        return root
    }
}
