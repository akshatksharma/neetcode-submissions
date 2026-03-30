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
 A -> B -> C -> D

 A


*/

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var curr = head
        var next: ListNode? = nil

        while curr != nil {
            let tempNext = curr?.next
            curr?.next = next

            if let tempNext {
                next = curr
                curr = tempNext
            } else {
                return curr
            }
        }

        return curr
    }
}
