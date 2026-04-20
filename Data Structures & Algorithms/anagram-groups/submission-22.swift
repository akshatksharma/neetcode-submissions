class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [[Int]: [String]]()

        for word in strs {
            var charArray = Array(repeating: 0, count: 26)
            let a: Character = "a"
            for char in word {
                if let charVal = char.asciiValue, let aVal = a.asciiValue {
                    charArray[Int(charVal) - Int(aVal)] += 1
                }
            }
            map[charArray, default: []].append(word)
        }

        return Array(map.values)
    }
}
