class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var baseWord = Array(strs[0])
        var result = ""

        for i in 0..<baseWord.count {
            for j in 0..<strs.count {
                let currWord = Array(strs[j])
                if i > currWord.count - 1 || currWord[i] != baseWord[i] {
                    return result
                }
            }

            result += String(baseWord[i])
        }

        return result
    }
}
