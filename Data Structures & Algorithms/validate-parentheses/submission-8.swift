class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        var pairs: [Character: Character] = [
            "(": ")",
            "[": "]",
            "{": "}"
        ]

        let chars = Array(s)
        for char in chars {
            switch char {
                case "(", "[", "{":
                    stack.append(char)
                case ")", "]", "}":
                    // check if it has a pair on the stack
                    if let lastChar = stack.last, pairs[lastChar] == char {
                        _ = stack.popLast()
                        continue
                    } else {
                        return false 
                    }
                default:
                    break
            }
        }

        if !stack.isEmpty {
            return false
        }
        
        return true
    }
}
