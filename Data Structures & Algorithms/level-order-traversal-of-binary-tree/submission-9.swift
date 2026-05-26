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

 import Collections

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [[Int]]() }

        var answer = [[Int]]()
        var queue = Deque<TreeNode>() // can impl as deque for O(1) pops and pushes

        queue.append(root)

        while !queue.isEmpty {
            let levelSize = queue.count
            var level = [Int]()

            for _ in 0..<levelSize { 
                let node = queue.removeFirst()
                level.append(node.val)

                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }

            if !level.isEmpty {
                answer.append(level)
            }
        }

        return answer
    }
}
