class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var finished = Set<Int>()
        var visited = Set<Int>()
        var adjList = [Int: [Int]]()

        /*
            [
                0: []
                1: [0]
                2: [0]
                3: [2]
            ]

        1 -> 0
             >
             |
        3 -> 2

        */

        for prereq in prerequisites {
            let baseCourse = prereq[1]
            let dependentCourse = prereq[0]

            if adjList[dependentCourse] == nil {
                adjList[dependentCourse] = []
            }

            adjList[baseCourse, default: []].append(dependentCourse)
        }

        func dfs(_ course: Int) -> Bool {
            guard !finished.contains(course) else { return true }
            guard !visited.contains(course) else { return false }
            guard let neighbors = adjList[course] else { return true }

            visited.insert(course)

            for neighbor in neighbors {
                if !dfs(neighbor) {
                    return false
                }
            }   
            visited.remove(course)
            finished.insert(course)
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
