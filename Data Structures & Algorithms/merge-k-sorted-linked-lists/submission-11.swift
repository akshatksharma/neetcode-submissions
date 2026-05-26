/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

import Collections 

extension ListNode: Equatable, Comparable {
    public static func <(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
    }
    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && rhs.next == lhs.next
    }
}

class Solution {
    /*
        2, 3, 4
        0, 1, 2
        0, 1, 3

        [0, 1, 2]

        dummy -> 0, 1, 2
                 |


        1, 2, 3
        []

        [1]
        []
                  
        dummmy -> 1

          have a min heap that contains the nodes
            for each list, load all the nodes that arent' nil
            
            while heap isn't empty
                pop the smallest node, append to ans
                put node.next into the heap if its not nil

    */

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var ans = ListNode(0) // dummy
        var curr: ListNode? = ans
        var heap = Heap<ListNode>()

        // add to list
        for list in lists {
            if let list {
                heap.insert(list)
            }
        }

        while let min = heap.popMin() {
            curr?.next = min
            curr = curr?.next

            if let next = min.next {
                heap.insert(next)
            }
        }

        return ans.next
    }


     /*
        okay so we have K sorted lists what's the API -> (val and next)
        can a given list be empty? can we be given an empty list of lists? -> yes
        lists can have duplicates -> yes

        brute force
            - dump all lists into an array, sort the array
            - time: O(NlogN) where N is the sum of the sizes of all lists
            - space: O(N) / O(1) depending on how you look at it 

        optimized
        - min heap? 
            have a min heap that contains the nodes
            for each list, load all the nodes that arent' nil
            
            while heap isn't empty
                pop the smallest node, append to ans
                put node.next into the heap if its not nil

            time: NlogK ... N is the number of items across all lists, K is the # of lists
            space: logK extra space (besides output array)


            for each index we're comparing k values and picking the min,
            then we advance the "index" in the one that we chose

            repeated comparisons ... min heap

            */
}