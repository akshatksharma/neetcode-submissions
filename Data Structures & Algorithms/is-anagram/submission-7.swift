class Solution {
    /*
    if strings not same len then bail with false. from there we could ..

    sort: sort chars in each string (default is like by encoding) compare char by char, return false if any pair doesn't match, true otherwise
    * time: NLogN where N is the size of the string
    * space: O(1) or O(N) depending if you count the char array we need to create to sort the string

    map: store counts of chars in first string in map, then subtract in second map. check to see if we have all counts == 0 at the end. 
    * time: O(N) where N is size of string. technically m matters too ... m is the size of the alphabet we use (since we need to iterate through char map) ... m is fixed so N 
    * space: O(N)
    */

    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        var sMap: [Character: Int] = [:]
        var tMap: [Character: Int] = [:]

        for char in s {
            sMap[char, default: 0] += 1
        }

        for char in t {
            tMap[char, default: 0] += 1
        }

        return tMap == sMap
    }
}
