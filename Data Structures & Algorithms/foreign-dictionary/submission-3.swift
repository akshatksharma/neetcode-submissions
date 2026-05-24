import Collections

class Solution {
    func foreignDictionary(_ words: [String]) -> String {
        // generate graph
        var orders = [[Character]]() // orders[0] < orders[1]

        for i in 0..<words.count-1 {
            // Case: ["abc", "ab"] is invalid as "abc" cannot come before "ab"
            if words[i].count > words[i+1].count && words[i].hasPrefix(words[i+1]) {
                return ""
            }
            if let order = generateOrder(words[i], words[i+1]) {
                orders.append(order)
            }
        }

        // get topological ordering
        if let ordering = ordering(orders, words) {
            return String(ordering)
        } else {
            return ""
        }
    }

    func generateOrder(_ wordA: String, _ wordB: String) -> [Character]? {
        var idx = 0
        var wordA = Array(wordA)
        var wordB = Array(wordB)

        // handle same length
        while idx < wordA.count && idx < wordB.count { // can only get differences within both bounds
            if wordA[idx] != wordB[idx] {
                return [wordA[idx], wordB[idx]] // return the first pairwise difference
            } 

            idx += 1
        }

        return nil // if no differences found pairwise, return nil (no ordering able to generated)
    }

    func ordering(_ orders: [[Character]], _ words: [String]) -> [Character]? {
        var ordering = [Character]()
        var graph = [Character: [Character]]()
        var indegrees = [Character: Int]()

        for word in words {
            for character in Array(word) {
                graph[character] = []
                indegrees[character] = 0
            }
        }

        for order in orders {
            graph[order[0], default: []].append(order[1])
            indegrees[order[1], default: 0] += 1
        }

        var queue = Deque<Character>()

        for (indegreeChar, indegreeCount) in indegrees {
            if indegreeCount == 0 {
                queue.append(indegreeChar)
            }
        }

        while let char = queue.popFirst() {
            ordering.append(char)

            let neighbors = graph[char]! // double check
            for neighbor in neighbors {
                indegrees[neighbor]! -= 1  // double check

                if indegrees[neighbor]! == 0 {
                    queue.append(neighbor)
                }
            }
        }

        guard ordering.count == graph.count else { return nil }

        return ordering
    }
}

/*
TOP OF MIND
- need to handle prefix case
- need to double check i == 1 case
- cycles


we need to figure out the order of the letters ... comparing words pairwise gives us some intel

    ["hrn","hrf","hrn","hrfa",er","enn","rfnn"]

    1. generate relationships by comparing each word with each word after it (N^2) ... actually bc its sorted we can compare adjacent words
    n < f
    h < e
    h < r

    r < n
    e < r


    2. do an order of these relationships ... O(N) time and space (topological sort)




*/

