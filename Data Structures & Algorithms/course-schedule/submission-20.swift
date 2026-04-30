class Solution {
    enum NodeState {
        case unvisited, visiting, visited
    }
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjList = Array(repeating: [Int](), count: numCourses)
        for prereq in prerequisites {
            adjList[prereq[1]].append(prereq[0])
        }
        var nodeStates: [NodeState] = Array(repeating: .unvisited, count: numCourses)

        func dfs(_ course: Int) -> Bool {
            let nodeState = nodeStates[course]

            switch nodeState {
                case .visiting:
                    return false
                case .visited:
                    return true
                case .unvisited:
                    break
            }

            nodeStates[course] = .visiting

            for neighbor in adjList[course] {
                if !dfs(neighbor) {
                    return false
                }
            }   

            nodeStates[course] = .visited

            return true
        }

        // fire dfs for each node
        for course in 0..<numCourses {
            if !dfs(course) {
                return false
            }
        }

        return true
    }

    /*

    approach
    build a adj list for course dependencies

    - if cycle -> false
    - need to step through graph and count until we reach numCourses unique nodes

    we can do dfs and keep track of a visited set and a count
        we keep adding neighbors to the visited and increment our count until we can't
        at that point we recurse back and remove nodes
            this lets us visit nodes from multiple paths
            but before we've unwound if we see a node already in our set, then we know there's a cycle
            and we can't do everything


    breakdown
    array of num pairs that ladder up to numCourses-1 + a numCourses num

        [
            [0, 1]
            [0, 2]
            [2, 3]
        ]
            -> [
                0: []
                1: [0]
                2: [0]
                3: [2]
            ]

        1 -> 0
             >
             |
        3 -> 2
        

         [
            [0, 1]
            [2, 0]
            [1, 2]
        ]
            [
            0: [2]
            1: [0]
            2: [1]
            ]


            1 -> 0
            \  /
              2

        [
            [0, 1]
            [1, 0]
        ]

            0 <> 1


    numbers are unique? 
    numcourses is the number of nodes in the graph
    */
}
