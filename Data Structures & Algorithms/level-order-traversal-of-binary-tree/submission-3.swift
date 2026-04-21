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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var answer = [[Int]]()
        var queue = [TreeNode?]() // can impl as deque for O(1) pops and pushes

        queue.append(root)

        while !queue.isEmpty {
            let levelSize = queue.count
            var level = [Int]()
            var i = 0
            while i < levelSize {
                if let node = queue.removeFirst() {
                    level.append(node.val)
                    queue.append(node.left)
                    queue.append(node.right)
                }
                i += 1
            }

            if !level.isEmpty {
                answer.append(level)
            }
        }

        return answer
    }
}
