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

class Solution {

    /*
            |
                   ||
    0 - 1 - 2 - 3 - 4
    
    0 - 1
    2 - 3 - 4
    |        
    4 - 3 - 2

    0 - 4 - 1 - 3 - 2



                    |
                  ||
    0 - 1 - 2 - 3

    0 - 3 - 1 - 2

    0
    */


    func reorderList(_ head: ListNode?) {
        // find mid point
        var slow = head // slow will end at our midpoint
        var fast = head

        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        // flip second half
        var prev: ListNode? = nil
        var curr = slow?.next
        slow?.next = nil

        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        // prev is the start of the flipped half

        // merge first half and flipped second half

        /*
        0 - 1
        4 - 3 - 2

        0 - 4 - 1 - 3 - 2

        */

        var headOG = head
        var headRev = prev

        while headOG != nil && headRev != nil {
            var nextOG = headOG?.next
            var nextRev = headRev?.next

            headOG?.next = headRev
            headRev?.next = nextOG

            headOG = nextOG
            headRev = nextRev
        }
        

    }
}
