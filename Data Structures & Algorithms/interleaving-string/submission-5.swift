class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        var s1 = Array(s1)
        var s2 = Array(s2)
        var s3 = Array(s3)
        guard s1.count + s2.count == s3.count else { return false }

        var memo: [[Bool?]] = Array(repeating: Array(repeating: nil, count: s2.count + 1), count: s1.count + 1)

        func recurse(_ s1Idx: Int, _ s2Idx: Int) -> Bool {
            // base cases
            if s1Idx + s2Idx >= s3.count {
                return true 
            }

            if let memoVal = memo[s1Idx][s2Idx] {
                return memoVal
            }

            if s1Idx < s1.count, s3[s1Idx + s2Idx] == s1[s1Idx] {
                if recurse(s1Idx + 1, s2Idx) {
                    memo[s1Idx][s2Idx] = true
                    return true
                }
            }

            if s2Idx < s2.count, s3[s1Idx + s2Idx] == s2[s2Idx]{
                if recurse(s1Idx, s2Idx + 1) {
                    memo[s1Idx][s2Idx] = true
                    return true
                }
            } 

            memo[s1Idx][s2Idx] = false
            return false // neither match

        }

        return recurse(0,0)
    }
}

/*

    dp on # of chars from each 

        given the current length of s1 and s3, we can get the idx of s1,s2,and s3
            if s1 matches, increase s1 idx and recurse ... if recurse is true, return true
            if s2 matches, increase s2 idx and recurse ... if recurse is true, return true
            if neither, then false 

        if s1 + s2 idx is out of bounds -> true



        a a b b      a a b b

        a a b b a a b b 

                            (s1 length, s2 length)

                                         _
                        a (1,0)                   a (0,1)

                a (2,0)       a (1,1)            a (0,1)        a (1,1)


        we can cache same index pair answer like 1,1 ... etc 

        we'll have a total of m*n unique computations, so this is O(m*n) time + O(m*n) space (due to call stack / dp array)

*/