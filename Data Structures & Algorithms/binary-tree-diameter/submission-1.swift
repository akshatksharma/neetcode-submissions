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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = Int.min

        func dfs(_ root: TreeNode?) -> Int {
            // base case
            guard let root else { return 0 }

            // calculate left and right heights
            let leftHeight = dfs(root.left)
            let rightHeight = dfs(root.right)

            // compute diameter
            let height = 1 + leftHeight + rightHeight
            diameter = max(diameter, height)

            // return 1 + largest child
            return 1 + max(leftHeight, rightHeight)
        }

        _ = dfs(root)

        return diameter - 1
    }

    /*
        diameter == length of the longest path

                B

                    A
                       C == 6
                    D       F
                E               G
                                    H


                    A
                B       E
            C
        D


        observations
        - diameter of a given root = 1 + diameter(root.left) + diameter(root.right)
        - but parent can only pick one of the child's children
            i.e B A C D E   or   B A C F G H 
        - so each root should return it's larger child

        algo
        - DFS through tree
        - at each node compute the diameter = 1 + diameter(root.left) + diameter(root.right)
        - compare that to a global max
        - pass up the 1 + length of the largest child 

            time O(N)
            space O(N) (call stack)

    */
}
