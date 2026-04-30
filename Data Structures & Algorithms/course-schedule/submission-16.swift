class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var visited = Set<Int>()
        var adjList = [Int: [Int]]() // maps courses to their unfinished dependencies

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

        for course in 0..<numCourses {
            adjList[course] = []
        }

        for prereq in prerequisites {
            let baseCourse = prereq[1]
            let dependentCourse = prereq[0]
            adjList[baseCourse, default: []].append(dependentCourse)
        }

        func dfs(_ course: Int) -> Bool {
            guard !visited.contains(course) else { 
                return false 
            }
            
            let neighbors = adjList[course]!
            guard !neighbors.isEmpty else { 
                return true 
            }

            visited.insert(course)

            for neighbor in neighbors {
                if !dfs(neighbor) {
                    return false
                }
            }   

            visited.remove(course)

            adjList[course] = [] // we've successfuly checked all dependent courses, so we don't have any unchecked dependencies

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
