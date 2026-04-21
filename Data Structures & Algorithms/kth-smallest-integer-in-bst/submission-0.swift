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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {

        var i = 0
        var ans = 0

        func dfs(_ root: TreeNode?) {
            guard let root else { return }
            dfs(root.left)
            i += 1
            if i == k {
                ans = root.val
            }
            dfs(root.right)
        }

        dfs(root)

        return ans
    }

    /*
                    5
                3       7
            1      4  6    8    

        1 3 4 5 6 7

        k = 1 -> 1
        k = 2 -> 3
        k = 5 -> 6
    */
}
