class Solution {
    func partition(_ s: String) -> [[String]] {
        let s = Array(s)
        var partitions = [[String]]()
        var currentPartition = [String]()

        func backtrack(_ startIdx: Int) {
            if startIdx >= s.count {
                partitions.append(currentPartition)
                return
            }

            var currentSubstring = [Character]()
            for i in startIdx..<s.count {
                currentSubstring.append(s[i])

                if isPalindrome(currentSubstring) {
                    currentPartition.append(String(currentSubstring))
                    backtrack(i + 1)
                    currentPartition.popLast()
                }
            }
        }

        backtrack(0)

        return partitions
    }


    func isPalindrome(_ chars: [Character]) -> Bool {
        var lo = 0
        var hi = chars.count - 1

        while lo < hi {
            if chars[lo] != chars[hi] {
                return false
            }

            lo += 1
            hi -= 1
        }

        return true
    }
}

/*

every substring in the split is a palindrome
    at min every char of size 1 is a palindrome

    abbac

    racmemcar

    aab
                              _
                    a

            a           aa

        b   ab X      b     aab X    
                    
                    
    ans = [a, a, b]

return all possible lists == we probably brute force it by backtracking

    we can grow a string from a starting point to the end and see if it's a palindrome O(N)
        if it is
            append to our list
            we recurse and do it again the i+1 ... end
                once start > end, then we append to our answer
            we pop the last item off our elemnet and continue increasing our substring

        time:
            N * 2^(N^2) .. for array of size N we have N^2 substrings, we are picking between all of them
                            and then for each of them we're doing N work (validing palidrome)

            

*/
