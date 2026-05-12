import Collections

class Solution {
    struct Elem: Comparable {
        let num: Int
        let freq: Int

        static func <(lhs: Elem, rhs: Elem) -> Bool {
            lhs.freq < rhs.freq
        }
    }


    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // track frequencies
        var freqMap = [Int: Int]()
        nums.forEach {
            freqMap[$0, default: 0] += 1
        }

        // make the heap
        var heap = Heap<Elem>()

        // load the heap
        for (num, freq) in freqMap {
            if heap.count < k {
                heap.insert(Elem(num: num, freq: freq))
            } else if let minElem = heap.min, minElem.freq < freq {
                _ = heap.popMin()
                heap.insert(Elem(num: num, freq: freq))
            }
        }

        // return the heap
        var ans = [Int]()
        while let minElem = heap.popMin() {
            ans.append(minElem.num)
        }
        return ans
    }


    /*
        [1, 2, 2, 3, 3, 4] k = 2 -> [2, 3]

            hashmap to track frequencies 
                O(n) time, O(m) space where m is # of unique elems, n is # of elems 
                worse case m = n, so O(n) time and space

            load KV pairs into min heap that are sorted by the frequency
                O(n*logk) time to make heap
                O(k) space

            total time O(nlogk) and space O(n+k)



            load KV pairs into an array, sort it by Val (# of occurences), pick the first k
                O(m) time and space to create

            

    */
}