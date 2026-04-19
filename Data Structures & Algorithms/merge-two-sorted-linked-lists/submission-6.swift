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

        var head1 = list1
        var head2 = list2
        var dummyHead: ListNode? = dummy

        while head1 != nil && head2 != nil {
            if head1!.val < head2!.val {
                dummyHead?.next = ListNode(head1!.val)
                head1 = head1?.next
                dummyHead = dummyHead?.next
            } else {
                dummyHead?.next = ListNode(head2!.val)
                head2 = head2?.next
                dummyHead = dummyHead?.next
            }
        }

        // handle cases when one is longer
        while head1 != nil {
            dummyHead?.next = ListNode(head1!.val)
            head1 = head1?.next
            dummyHead = dummyHead?.next
        }

        while head2 != nil {
            dummyHead?.next = ListNode(head2!.val)
            head2 = head2?.next
            dummyHead = dummyHead?.next
        }

        return dummy.next
    }
}
