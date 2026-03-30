class Solution {

    /*
        breakdown
        - empty arrays
        - single string arrays
        - empty string
        - repeat string

        for each element, check all the other elements for being an anagram and build up a mapping of the chars in the anagram to a Set of the words
        * key thing is that all anagrams map to the same key when sorted
        * we use a set because of duplicates


        for str in strs
            if str.sorted in map
                map[str.sorted].insert(str)
            else
                map[str.sorted] = Set(str)

        return map.values

        Time
        * for each elem we're sorting chars and doing constant time inserts. we then do a linear pass of all items
        * N * MlogM where M is size of longest str

        Space
        * O(M * N) where M is size of longest string and N size of the input ... we are storing a set so we should see each elem once

        ["cat", "act", "hello", "cat"]

        [
        "act": ["cat", "act"],
        "hello" : ["hello"]
        ]

        [["cat", "act"], ["hello"]]


        [""]

        ["": [""]]
    */

    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]

        for str in strs {
            let key = String(str.sorted())
            if var anagrams = map[key] {
                map[key] = anagrams + [str]
            } else {
                map[key] = [str]
            }
        }

        return map.values.map { Array($0) }
    }
}
