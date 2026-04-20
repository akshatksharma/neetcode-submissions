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

    2 stages
    - find where to remove -- are we guaranteed it'll be in there? log(n)
    - execute the remove -- log(n)
        0 children - O(1)
        1 children - O(1)
        2 children - need to find the largest val in the left side (logn), update val O(1), then remove it log(n)


                5
            1       7
               4

    for the first step, we're throwing away half the tree each time, so if it's abalanced tree that's half the tree
        so this'll mean it'll take logn steps at most ... since it takes logn steps to divide a tree of size n to a leaf node (size 1)


    we're going to need to return the updated tree at each step

    */


    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root else { return nil }

        if key > root.val {
            root.right = deleteNode(root.right, key)
        } else if key < root.val {
            root.left = deleteNode(root.left, key)
        } else {
            if root.right == nil && root.left == nil { // maybe can remove
                return nil 
            } else if root.right == nil {
                return root.left
            } else if root.left == nil {
                return root.right
            } else {
                // find largest in the left subtree
                let largestInLeft = findLargest(root.left)!
                root.val = largestInLeft.val
                root.left = deleteNode(root.left, largestInLeft.val)
            }
        }

        return root
    }

    func findLargest(_ root: TreeNode?) -> TreeNode? {
        var curr = root
        while curr != nil && curr?.right != nil {
            curr = curr?.right
        }
        return curr
    }

}
