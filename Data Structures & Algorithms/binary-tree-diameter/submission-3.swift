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

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = [TreeNode?]()

        func dfs(_ root: TreeNode?) -> [TreeNode?] {
            // base case
            guard let root else { return [] }

            // calculate left and right heights
            let leftNodes = dfs(root.left)
            let rightNodes = dfs(root.right)

            // compute diameter
            let path = leftNodes.reversed() + [root] + rightNodes

            if path.count > diameter.count {
                diameter = path
            }

            // return 1 + largest child
            if leftNodes.count > rightNodes.count {
                return [root] + leftNodes
            } else {
                return [root] + rightNodes
            }
        }

        _ = dfs(root)
        print(diameter)

        return diameter.count - 1
    }

    /*
        diameter == length of the longest path

                B

                    A
                        C 
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

