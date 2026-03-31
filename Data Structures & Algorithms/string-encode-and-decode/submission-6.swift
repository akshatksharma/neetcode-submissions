class Solution {

    /*
    breakdown
    - we need some way to deliniate word breaks -> /
    - need a way to escape our delimter (and escape our escape) -> #

    ["Hello", "World", "Akshat"] -> "Hello/World/Akshat"

    ["Hello/, ",World"] -> "Hello#//World"

    ["Hello###, ",World#"] -> "Hello######/World##"

    ["Hello World", "Akshat"] -> "Hello World/Akshat"

    */

    func encode(_ strs: [String]) -> String {
        var encodedStrs = [String]()

        for str in strs {
            var encodedChars = [Character]()
            for char in str {
                if char == "/" || char == "#" {
                    encodedChars.append("#")
                    encodedChars.append(char)
                } else {
                    encodedChars.append(char)
                }
            }
            encodedChars.append("/")
            encodedStrs.append(String(encodedChars))
        }

        return encodedStrs.joined()
    }

    func decode(_ str: String) -> [String] {
        var strArray = Array(str)
        var ans = [String]()

        // "Hello/World"
        // [""]

        var currentWord = [Character]()
        var idx = 0
        while idx < strArray.count {
            let char = strArray[idx]
            if char == "#", idx < strArray.count - 1 {
                // add the next char if it's safe
                let nextChar = strArray[idx + 1]
                currentWord.append(nextChar)
                idx += 2
            } else if char == "/" {
                // add the current word
                ans.append(String(currentWord))
                currentWord = []
                idx += 1
            } else {
                currentWord.append(char)
                idx += 1
            }
        }

        return ans
    }
}
