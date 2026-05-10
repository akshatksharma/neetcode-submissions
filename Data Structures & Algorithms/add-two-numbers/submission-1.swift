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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var ans = ListNode(0)

        var currAns: ListNode? = ans
        var currL1 = l1
        var currL2 = l2

        var carry = 0

        // either are non nil
        while currL1 != nil || currL2 != nil {
            let l1Val = currL1?.val ?? 0
            let l2Val = currL2?.val ?? 0

            let sum = l1Val + l2Val + carry

            let digit = sum % 10
            currAns?.next = ListNode(digit)

            carry = sum / 10

            currL1 = currL1?.next
            currL2 = currL2?.next
            currAns = currAns?.next
        }

        if carry > 0 {
            currAns?.next = ListNode(carry)
        }

        return ans.next
    }

    /*
    notes
    - NON EMPTY linked lists of NON NEG ints stored REVERSE ORDER
    - represented numner does NOT HAVE leading zeros
    - return NEW LINKNED LIST

        2 5 3
        5 6 4

        7 1 8  (352 + 465 = 817) // handling carrying

        2 4 3
        0 5 2  
        
        2 9 5   (342 + 250 = 592)

        8 7 
        2 4

        0 4 1    (78 + 62) // handling carrying last digit

        0 8 7 
        2 4 _ // if one digit is longer it's like we're adding 1

        2 2 8

        0
    */
}