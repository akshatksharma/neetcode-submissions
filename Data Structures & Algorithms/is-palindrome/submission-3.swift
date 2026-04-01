extension Character {
    var isAlphanumeric: Bool {
        return self.isLetter || self.isNumber
    }
}

class Solution {

    /*
    breakdown
    - case insenstive 
    - ignores all alphanumeric chars 

    edgecases
    - empty string? (not gna happen)

    approach
    - you can just use 2 pointers at each end and compare each char until one is off -- if none are off, then just call it true


    taat
    ana
    */

    func isPalindrome(_ s: String) -> Bool {
        let sArr = Array(s.lowercased())
        var l = 0, r = sArr.count - 1

        while l < r {
            if !sArr[l].isAlphanumeric {
                l += 1
                continue
            }

            if !sArr[r].isAlphanumeric {
                r -= 1
                continue
            }

            if sArr[l] != sArr[r] {
                return false
            }

            l += 1
            r -= 1
        }

        return true
    }
}
