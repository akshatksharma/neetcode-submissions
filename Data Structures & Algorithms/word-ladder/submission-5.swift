import Collections

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var length = 1

        var queue = Deque<String>()
        queue.append(beginWord)

        var seen = Set<String>()
        seen.insert(beginWord)

        while !queue.isEmpty {
            let levelSize = queue.count

            for _ in 0..<levelSize {
                let word = queue.popFirst()!

                if word == endWord {
                    return length
                }

                for nextWord in wordList {
                    if isValidTransform(word, nextWord), !seen.contains(nextWord) {
                        seen.insert(nextWord)
                        queue.append(nextWord)
                    }
                }
            }

            length += 1
        }

        return 0
    }

    func isValidTransform(_ word1: String, _ word2: String) -> Bool {
        var word1 = Array(word1)
        var word2 = Array(word2)
        var i = 0
        var numDifferences = 0

        while i < word1.count { // we're guaranteed they're same length
            if word1[i] != word2[i] {
                numDifferences += 1
                if numDifferences > 1 {
                    return false
                }
            }

            i += 1
         }

         return true
    }
}

/*
    can treat this like a graph starting from cat and ending at sag
        between words we have wordList 
        we have edges between words if theydiffer by 1 char
    we do a level set bfs to get the shortest path, 
        we use a visited set to make sure we don't double dip
        we keep track of a rolling count

    if we never reach endWord, then we return our default


    unclear on these
    time: O(E) ... worst case we go through every edge (since it could be a deeply connected graph)
    space: O(V) ... worst case queue could have every node in the queue


*/