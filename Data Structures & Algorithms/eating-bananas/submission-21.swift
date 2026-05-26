class Solution {

    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        let maxPile = piles.max()!

        var lo = 1
        var hi = maxPile
        var k = maxPile

        func isValid(_ k: Int) -> Bool {
            var totalHours = 0
            for pile in piles {
                var numHours = ceil(Double(pile) / Double(k))
                totalHours += Int(numHours)

                if totalHours > h {
                    return false
                }
            }

            return true
        }
        
        while lo <= hi {
            let mid = lo + ((hi-lo) / 2)

            if isValid(mid) {
                k = mid
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }

        return k
    }

    /*
        [5, 10, 4, 1, 2]  h = 5 -> min k?

            needs to eat rate to clear the largest size -> 10

       [5, 10, 4, 1, 2]  h = 10 -> min k?

            fastest would be eat rate to clear the largest size -> 

                22 bananas, 10 hours -> 2.2 -> round up to 3 per hour
                2+4+2+1+1 = 10

        we know the ans is between
            1 ... max(bananas)

            feels like a binary search problem ... if we go too fast we see if we can
            go slower and vice versa

            Q is can we verify a k is valid in constant time

                [5, 10, 4, 1, 2] and h = 10, k = 2

                3 + 5 + 2 + 1 + 1 = 12

                22 / 2 = 11

                we want the lower bound .. if it works we keep pushing it down

                [1 2 3 4 5 6 7 8 9 10]

                22 / 5 = 4.25 -> 5 < 10
                22 / 3 = 7.33 -> 8 < 10
                22 / 2 = 11 > 10

                we end up at 3


    */
}