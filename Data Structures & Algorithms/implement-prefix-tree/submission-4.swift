class PrefixTree {
    class PrefixNode {
        var characters: [Character: PrefixNode]
        var isLastChar: Bool

        init(_ characters: [Character: PrefixNode] = [:], _ isLastChar: Bool = false) {
            self.characters = characters
            self.isLastChar = isLastChar
        }
    }

    private var root = PrefixNode()

    func insert(_ word: String) {
        var curr = root

        for char in Array(word) {
            if let next = curr.characters[char] {
                curr = next
            } else {
                let newNode = PrefixNode()
                curr.characters[char] = newNode
                curr = newNode
            }
        }

        curr.isLastChar = true
    }

    func search(_ word: String) -> Bool {
        var curr = root

        for char in Array(word) {
            if let next = curr.characters[char] {
                curr = next
            } else {
                return false
            }
        }

        return curr.isLastChar
    }

    func startsWith(_ prefix: String) -> Bool {
        var curr = root

        for char in Array(prefix) {
            if let next = curr.characters[char] {
                curr = next
            } else {
                return false
            }
        }

        return true
    }
}
