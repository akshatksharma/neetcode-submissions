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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxPathSum = Int.min

        func dfs(_ root: TreeNode?) -> Int {
            // base cases
            guard let root else { return 0 }

            // recursion
            let leftSum = max(dfs(root.left), 0)
            let rightSum = max(dfs(root.right), 0)

            let pathSumThroughRoot = root.val + leftSum + rightSum
            maxPathSum = max(maxPathSum, pathSumThroughRoot)

            return root.val + max(leftSum, rightSum)
        }

        _ = dfs(root)

        return maxPathSum
    }

    /*
        root of non empty binary tree ... return max path sum 

        notes
        - return max sum
        - node can't appear in sequence more than once
        - path does NOT need to include the root

        approaches
        - ans can span multiple subtrees  
        - for a given node, we need to consider values of its children
            children can only pass up one of their child's paths  


                        100

                    10          20

                            15          5

                        -5

            track some global max
            recurse through the tree -- dfs
                base cases
                    nil == 0
                at a node ...
                    max path through that node = node.val + dfs(node.left) + dfs(node.right)
                    compare with global max
                    pass up max of either child + val
    */
}
