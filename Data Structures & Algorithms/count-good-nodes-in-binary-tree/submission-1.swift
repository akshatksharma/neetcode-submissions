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
    func goodNodes(_ root: TreeNode?) -> Int {
        var numGoodNodes = 0

        func dfs(_ root: TreeNode?, _ currentMax: Int) {
            // base case
            guard let root else { return }

            if root.val >= currentMax {
                numGoodNodes += 1
            }

            let newMax = max(currentMax, root.val)
            dfs(root.left, newMax)
            dfs(root.right, newMax)
        }

        dfs(root, root!.val)

        return numGoodNodes
    }
}

/*
breakdown
- node x is good if path from root to x has NO nodes > x

checklist
- duplicates
- include root always

test cases

                2 X

        1               4

    3 X               5 X     2


        
        5 X



        5 X
    5 X

approaches
- graph traversal 
    
    a node being good depends on the path on the way to it 
    we want a way to know the largest value along a path
        can pass in the current max
        if our val is >= current max
            we increment # good nodes
            we pass that as our max going down 


*/
