extension String {
    func countChar(_ charToFind: Character) -> Int {
        var num = 0
        for char in Array(self) {
            if char == charToFind {
                num += 1
            }
        }

        return num
    }
}

class Solution {
    func key(_ i: Int, _ m: Int, _ n: Int) -> String {
        "\(i)_\(m)_\(n)"
    }

    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var memo = [String: Int]()

        func recurse(_ i: Int, _ m: Int, _ n: Int) -> Int {

            if m < 0 || n < 0 {
                return Int.min
            }

            if i >= strs.count {
                return 0
            }

            if let memoValue = memo[key(i, m, n)] {
                return memoValue
            }

            // check memo

            let skipValue = recurse(i+1, m, n)

            let updatedM = m - strs[i].countChar(Character("0"))
            let updatedN = n - strs[i].countChar(Character("1"))
            let keepValue = 1 + recurse(i+1, updatedM, updatedN) 

            let maxSize = max(skipValue, keepValue)

            memo[key(i, m, n)] = maxSize

            return maxSize
        }

        return recurse(0, m, n)
    }

    /*
        across all the strings in the list, we need to have at most m 0s and n 1s
        we can't split up a string we either have it or not

        so it's like we have 2 capacities, m and n

        ["01", "00", "1"]   m = 3, n = 1

            F(i, m, n) = size of subset starting at i thats under m 0s and n 1s

                F(i, m, n) = max( F(i+1, m, n)  , 1 + F(i+1, m-# ms in strs[i], n-# ns in strs[i])

                    if m < 0 or n < 0 -> return Int.min
                    if i >= strs.count -> return 0

        
        time: O(str.count * n * m)
        space: O(str.count * n * m)


    */
}