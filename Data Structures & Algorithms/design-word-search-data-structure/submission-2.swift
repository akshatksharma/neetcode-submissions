class WordDictionary {
    class Node {
        var chars: [Character: Node]
        var isLastChar: Bool

        init(_ chars: [Character: Node] = [:], _ isLastChar: Bool = false) {
            self.chars = chars
            self.isLastChar = isLastChar
        }
    }

    private var root = Node()

    func addWord(_ word: String) {
        var curr = root
        for char in Array(word) {
            if let next = curr.chars[char] {
                curr = next
            } else {
                let newNode = Node()
                curr.chars[char] = newNode
                curr = newNode
            }
        }
        curr.isLastChar = true
    }

    func search(_ word: String) -> Bool {
        let word = Array(word)

        func recurse(_ root: Node, _ i: Int) -> Bool {
            // base case
            if i == word.count {
                return root.isLastChar
            }

            if let next = root.chars[word[i]] {
                return recurse(next, i+1)
            } else {
                if word[i] == "." {
                    for (_, node) in root.chars {
                        if recurse(node, i+1) {
                            return true
                        }
                    }
                    
                    return false
                } else {
                    return false
                }
            }


        }

        return recurse(root, 0)
    }


    /*
        im thinking of a trie, not hashmap
           - addWord is easy to do with a hashmap
           - search is hard to do with a hashmap since we
            can have characters in the input that map to many

        on the other hand with a trie ,
            - we could impl addWord by adding the chars in the word to the trie
            - could impl search by going through the chars in our trie
                when we have a ., we can match as long as we have something in that layer


                       _
                    d    b          
                a           b
            y      d           y

            *by

            addWord: O(n) where n is len of word
            search: O(n) where n is len of word
    */
}
