class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var path = ["JFK"]
        var graph = [String: [String]]()

        tickets.forEach { ticket in 
            graph[ticket[0], default: []].append(ticket[1])
        }
        // sorting lexographically
        for (start, destination) in graph {
            graph[start] = destination.sorted()
        }

        func backtrack(_ start: String) -> Bool {
            // base cases
            if path.count == tickets.count + 1 {
                return true // we good
            }

            guard let destinations = graph[start] else { return false }

            for i in 0..<destinations.count {
                let destination = destinations[i]
                // add to path, remove from graph
                path.append(destination)
                graph[start]?.remove(at: i)

                // backtrack
                if backtrack(destination) {
                    return true
                }

                // remove from path, add back to graph
                path.removeLast()
                graph[start]?.insert(destination, at: i)
            }

            return false
        }

        _ = backtrack(path[0])

        return path
    }
}

/*
    need to hit every edge once
    at any point, need to hit the edge that has the lexicographically lower name

    1. Build adjacency list ... maintain the order so the lexicographically lowest name is first
    2. dfs from JFK
            for each neighbor
                add to result
                remove neighbor from node's adjacency list
                dfs to neighbor node
*/