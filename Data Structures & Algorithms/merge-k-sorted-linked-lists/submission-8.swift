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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }

        func mergeLists(_ loIdx: Int, _ hiIdx: Int) -> ListNode? {
            if hiIdx == loIdx { // 1 item
                return lists[loIdx]
            }

            if hiIdx - loIdx == 1 { // 2 items
                return mergeTwoLists(lists[loIdx], lists[hiIdx])
            }

            let midIdx = (loIdx + hiIdx) / 2
            let leftMerge = mergeLists(loIdx, midIdx)
            let rightMerge = mergeLists(midIdx+1, hiIdx)

            return mergeTwoLists(leftMerge, rightMerge)
        }

        return mergeLists(0, lists.count-1)
    }

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let ans = ListNode(0) // dummy
        var currAns: ListNode? = ans
        var curr1: ListNode? = list1
        var curr2: ListNode? = list2

        while curr1 != nil, curr2 != nil { // both not nil
            if curr1!.val < curr2!.val {
                currAns?.next = curr1
                curr1 = curr1?.next
                currAns = currAns?.next
            } else {
                currAns?.next = curr2
                curr2 = curr2?.next
                currAns = currAns?.next
            }
        }

        if curr1 != nil { // only one not nil, we can add the rest of the chain
            currAns?.next = curr1
            curr1 = curr1?.next
            currAns = currAns?.next
        } else if curr2 != nil {
            currAns?.next = curr2
            curr2 = curr2?.next
            currAns = currAns?.next
        }

        return ans.next
    }


    /*

    mid = (0 + 3) / 2 = 1

    0    2 5
    1    3 1
    2    4
    3    5 2

        0    2 5
        1    3 1
                            
            dummy -> 2 -> 5

            4
            5 2

    mid = (0 + 2) / 2 = 1

    0    2 5
    1    3 1
                2 5
                3 1

                4

    2    4

        merge sort and then use merge 2 lists
            if sublist is <= 1 -> return list
            if sublist is == 2 -> return mergeTwoList(l1, l2)
            else return mergeKLists(lists[0...mid], lists[mid+1...lists.count-1])
    */
}
