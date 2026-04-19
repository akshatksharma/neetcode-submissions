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
           |
    1 3 4
        |
    2 5
                            |
    dummy - 1 - 2 - 3 - 4 - 5

    1 2
    _

 */

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)

        var h1 = list1
        var h2 = list2
        var d: ListNode? = dummy

        while h1 != nil && h2 != nil {
            if h1!.val < h2!.val {
                d?.next = ListNode(h1!.val)
                h1 = h1?.next
                d = d?.next
            } else {
                d?.next = ListNode(h2!.val)
                h2 = h2?.next
                d = d?.next
            }
        }

        if let h1 {
            d?.next = h1
        } else if let h2 {
            d?.next = h2
        }

        return dummy.next
    }
}
