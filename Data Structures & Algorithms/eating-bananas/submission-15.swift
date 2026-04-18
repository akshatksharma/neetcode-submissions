class Solution {

    /*
    piles has # of bananas in each pile
    h is # of hours you have to eat them

    we need to find k, the eating rate per hour
        each hour we can eat k bananas from one pile
        if its < k then we can just finish that without going into the next pile
    
    find min k 


    implementation
    - naive: try every k starting from some number i, maybe start i at 1? fastest suitable eat rate would be enough to oneshot the largest pile i.e O(max(piles))
        for each k, we do h operations then see if we've ate all bananas
            i.e if we're at the last index with 0 bananas

            time complexity worst case is O(max(piles) * h)
            space is O(piles) since we'll pass in a copy

    - or maybe we try to find k using some sort of binary search?
        range between 1 and max(piles)
            we can do h operations O(log(max(piles))) times

            time is O(h * log(max(piles))) + O(n)
            space is O(piles)

    lo  mid      hi
    [1, 2, 3, 4]


    [1, 4, 3, 2]
    */


    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        let maxK = piles.max() ?? 1 // O(n)
        var lo = 1, hi = maxK

        while lo < hi {
            let mid = lo + ((hi - lo) / 2)

            if !canKokoFinish(piles, h, mid) {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return lo
    }

    // [1, 4, 3, 2]
    private func canKokoFinish(_ piles: [Int], _ h: Int, _ k: Int) -> Bool {
        var totalTime = 0

        for pile in piles {
            let elapsedTime = pile / k
            totalTime += elapsedTime

            if pile % k > 0 {
                totalTime += 1
            }

            if totalTime > h {
                return false
            }
        }

        return true

        // var mutablePiles = piles
        // var i = 0
        // for _ in Array(0..<h) {
        //     mutablePiles[i] -= k

        //     if mutablePiles[i] <= 0 {
        //         if i == piles.count - 1 {
        //             return true
        //         } else {
        //             i += 1
        //         }
        //     }
        // }

        // return false
    }
}
