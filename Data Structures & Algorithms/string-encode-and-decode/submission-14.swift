class Solution {

    func encode(_ strs: [String]) -> String {
        var ans = [String]()

        for str in strs {
            let count = str.count
            ans.append("\(count)#\(str)")
        }

        guard !ans.isEmpty else { return "" }

        return ans.joined()
    }   

    func decode(_ str: String) -> [String] {
        let str = Array(str)
        var ans = [String]()

        guard !str.isEmpty else { return ans }

        var idx = 0
        while idx < str.count {
            // march idx to pound
            var countChars = [Character]()
            while str[idx] != "#" {
                countChars.append(str[idx])
                idx += 1
            }

            // build number
            let count = Int(String(countChars))! // see if we can do this more safely  

            // grab string from curr idx
            // if idx < str.count - 1 {
            //     let decodedChunk = String(str[idx+1..<idx+1+count])
            //     ans.append(decodedChunk)
            // } else {
            //     ans.append("")
            // }

            let decodedChunk = String(str[idx+1..<idx+1+count])
            ans.append(decodedChunk)

            // advance idx 
            idx = idx+1+count
        }

        return ans
    }

    /*

    ["Hello", "World"] -> 

    ["Hello World", "A"] ->

    [] ->

    [""] -> 

    ["Hello World", ""] ->

    we could try to encode the # of chars

        [Hello, World] -> "5#Hello5#World"    
        [Hell#o, World] -> "6#Hell#o5#World"
        [Hello5, World] -> "6#Hello510#WorldWorld"
        [] -> ""
        [""] -> "0#"

        encode
            time: O(m)
            space O(max string size)
        decode
            same


    we could try to encode a delimiter

        [Hello, World] -> [Hello#World]

        [Hell#o, World] -> [Hell/#o#World]

        [He/ll#o, World] -> [He//ll/#o#World]

        encode -> 
            time: O(m) where m is the # of chars in the whole array
            space: O(max(m_i)) where m_i is the size of an individual word since we need intermediary strings

        decode -> 
            time: O(m)
            space: O(max(m_i))

    */
}
