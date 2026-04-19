/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

 /*
    0 - 1 - 2 - 3 - 4
    0 - 4 - 1 - 3 - 2

    0
    0

    0 - 1
    0 - 1

    0 - 1 - 2
    0 - 2 - 1 

 */

class Solution {
    func reorderList(_ head: ListNode?) {
        var nodes = [ListNode?]()

        var node = head
        while node != nil {
            nodes.append(node)
            node = node?.next
        }

        //       lo 
        //        hi
        // [0, 1, 2, 3, 4]

        // 0 - 1 - 2 - 3 - 4
        // 0 - 4 - 1 - 3 - 2 -> nil

        var lo = 0
        var hi = nodes.count - 1

        while lo < hi {
            nodes[lo]?.next = nodes[hi]
            lo += 1
            nodes[hi]?.next = nodes[lo]
            hi -= 1
        }

        nodes[lo]?.next = nil
    }
}
