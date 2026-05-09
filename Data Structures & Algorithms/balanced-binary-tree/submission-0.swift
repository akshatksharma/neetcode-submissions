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
        var isBalanced = true

        func dfs(_ root: TreeNode?) -> Int {
            // base cases
            guard let root else { return 0 }
            // guard isBalanced else { return  }

            // get child heights
            let leftHeight = dfs(root.left)
            let rightHeight = dfs(root.right)

            // compare heights and update isBalanced
            if abs(leftHeight - rightHeight) > 1 {
                isBalanced = false
            }

            // return 1 + max(left and right height)
            return 1 + max(leftHeight, rightHeight)
        }

        _ = dfs(root)

        return isBalanced
    }
}

/*
    height balanced -> L and R subtrees of EVERY node differ by no more than 1

                 A -> YES

                A  -> YES
            B

                A  -> NO
            B
        C

                A  -> YES
            B      D 
        C

                A  -> NO
            B      E
        C              G
    F                       H


    need to pass up the heights between nodes
    need to update global variable about whether we're balanced 
    everywhere or not 
        if global is false, then we can stop recursion early

        O(N) time and space
*/
