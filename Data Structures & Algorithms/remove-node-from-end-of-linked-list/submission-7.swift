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
    - "from end"
    - at least one node
    - can we at any node? -> yes

            
    1 - 2 - 3 - 4
    4 - 3 - 1
    

    O(N) soln, reverse the list, overwrite it, reverse it again

 */

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var reversedHead = reverseList(head)
        var curr = reversedHead

        if n == 1 {
            curr = curr?.next
            return reverseList(curr)
        } else {
            var idx = 0
            while idx < n - 2 {
                curr = curr?.next
                idx += 1
            }
            curr?.next = curr?.next?.next
            return reverseList(reversedHead)
        }

    }


    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head

        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }

        return prev
    }
}
