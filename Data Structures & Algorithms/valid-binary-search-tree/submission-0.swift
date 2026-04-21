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
    - no dupes

                        5
                    3       6
                2       4

                        5
                    3       5
                2       4

                        5
                    3       6
                2       7           
                
                        _
        
        at any point we need to enforce a range that values need to be in
            at the start its like unbounded
            but if we go left, the current node's val is the max value
            if we go right, the current node's val is the min value
            if we're nil we are "valid" as well
            we pass that into each node and check values

            O(n) time since we have to go through all nodes in the worst case 
            O(n) space since we're dfs-ing through this all
    */

    func isValidBST(_ root: TreeNode?) -> Bool {
        func isValid(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
            guard let root else { return true }

            let nodeIsValid = root.val > min && root.val < max

            return nodeIsValid 
                && isValid(root.left, min, root.val)
                && isValid(root.right, root.val, max)
        }

        return isValid(root, Int.min, Int.max)
    }
}
