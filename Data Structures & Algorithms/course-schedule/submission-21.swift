class Solution {
    enum TraversalStatus {
        case unvisited
        case visiting
        case visited
    }

    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjList = Array(repeating: [Int](), count: numCourses)
        for prerequisite in prerequisites {
            adjList[prerequisite[0]].append(prerequisite[1])
        }

        var statuses = Array(repeating: TraversalStatus.unvisited, count: numCourses)

        func dfs(_ course: Int) -> Bool {
            let status = statuses[course]

            switch status {
                case .visiting:
                    return false
                case .visited:
                    return true
                case .unvisited:
                    statuses[course] = .visiting

                    for prereq in adjList[course] {
                        if !dfs(prereq) {
                            return false
                        }
                    }

                    statuses[course] = .visited
            }

            return true 
        }

        for course in 0..<numCourses {
            // call dfs if we haven't visited it yet
            if statuses[course] == .unvisited {
                if !dfs(course) {
                    return false
                }
            }
        }

        return true
    }
}

/*
    1. make an adj list (directed graph)
    2. find if there's a cycle 
        can do kahns
        or dfs with visiting / visited states .. need to start from every node
        since we might have disconnected components

            [0,1] [1,2] [2,3] [1,3] [3,4] [5,6]

                [
                    [1]
                    [2,3]
                    [3]
                    [4]
                    []
                    [6]
                    []
                ]


                    -> 2 -> 3 -> 4
            0 -> 1 -------->

                      -> 2 -> 3 -> 4
            0 -> 1 -> 5
                 ------------->


                   -> 2 -> 3 -> 4
            0 -> 1 <--------
*/
