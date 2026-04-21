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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty, !inorder.isEmpty else { return nil }

        var inorderMap = [Int: Int]() // mapping treenode val to idx
        inorder.enumerated().forEach { idx, val in
            inorderMap[val] = idx
        }

        var rootIdx = 0

        func dfs(_ loIdx: Int, _ hiIdx: Int) -> TreeNode? {
            // handle base case
            guard loIdx <= hiIdx else { return nil }

            let rootVal = preorder[rootIdx]
            let rootNode = TreeNode(rootVal)

            rootIdx += 1 // move this??

            let midIdx = inorderMap[rootVal]!

            rootNode.left = dfs(loIdx, midIdx - 1)
            rootNode.right = dfs(midIdx + 1, hiIdx)

            return rootNode
        }

        return dfs(0, inorder.count - 1)
    }

    /*
                    A
                B       C
            D      E

        preorder -> all the roots
        A B D E C

        inorder -> given a root it segments L and R
        D B E A C

        lo = 0
        hi = 0

        for each node in preorder
            make it a node
            set it's left and right recursively
                we divide down array items to the left and right of node's position in inorder

                base case is when the the low index is higher than the high index
                    in that case the child are nil 

        we do _ operations across the n nodes in perorder
            these operations dwindle down over time ... across them all it's n total operations
            since we divide the array down

        so it's O(n) overall time and O(n) space due to callstack

    */
}
