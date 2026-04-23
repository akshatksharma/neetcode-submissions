class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var baseWord = Array(strs[0])
        var R = 0 // end index of longest prefix in baseWord that is in every word

        while R < baseWord.count {
            var i = 0 // index of word we're looking at
            while i < strs.count {
                var currentWord = Array(strs[i])
                if R < currentWord.count && currentWord[R] == baseWord[R] {
                    i += 1
                } else {
                    return R == 0 ? "" : String(Array(baseWord[0..<R]))
                }
            }

            R += 1
        }

        return R == 0 ? "" : String(Array(baseWord[0..<R]))
    }

    /*
        ["flower", "fl", "flemish"]

        ["a", "b", ""]

        ["hello"]



        array of strings
            repeat strings
            empty strings?
            empty array?

            if nothing shared, we return ""

        brute force: for each substring for the first word, check all other words
            O(m * n) for m chars in first word and n words in array ... m prefixes

        
    */
}