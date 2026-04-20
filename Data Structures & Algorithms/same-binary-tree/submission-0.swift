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
    1)
                    A

                B           D

            C       E

                    A

                B           D

            C

    2)
            A

            _

    */


    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } 
        
        if (p == nil && q != nil) || (p != nil && q == nil) {
            return false
        }

        if p?.val != q?.val {
            return false
        }

        let isLeftSameTree = isSameTree(p?.left, q?.left)
        let isRightSameTree = isSameTree(p?.right, q?.right)

        return isLeftSameTree && isRightSameTree
    }
}
