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
                        R
            L
                x
    D - 1 - 2 - 3 - 4
 */

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(0)
        dummy.next = head

        var lo: ListNode? = dummy
        var hi = head

        var idx = 0
        while idx != n {
            hi = hi?.next
            idx += 1
        }

        if hi == nil {
            dummy.next = dummy.next?.next
            return dummy.next
        }

        while hi != nil {
            lo = lo?.next
            hi = hi?.next
        }

        lo?.next = lo?.next?.next

        return dummy.next
    }
}
