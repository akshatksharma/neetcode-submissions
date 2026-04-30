class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        // make adj list
        var adjList = [Int: [Int]]()
        for course in 0..<numCourses {
            adjList[course] = []
        }
        for prereq in prerequisites {
            adjList[prereq[0], default: []].append(prereq[1])
        }

        var ans = [Int]()
        var visiting = Set<Int>()
        var finished = Set<Int>()

        /* dfs on each elem, 
            track which ones we're visiting
            which one's we've finished visiting
            path so far
        */
        func dfs(_ course: Int) -> Bool {
            // base cases
            if visiting.contains(course) {
                return false
            }

            if finished.contains(course) {
                return true
            }
            
            let neighbors = adjList[course]! 

            // recurse
            visiting.insert(course)
            for neighbor in neighbors {
                if !dfs(neighbor) {
                    return false
                }
            }
            visiting.remove(course)
            finished.insert(course)
            ans.append(course)

            return true
        }

        // since nodes might not be connected we run from all starting points
        for course in 0..<numCourses {
            if !dfs(course) {
                return []
            }
        }

        return ans
    }

    /*
        [[0,1] [1, 2] [2, 3] [2, 4]]
                    
        0 -> 1 -> 2 -> 3
                  -> 4 

        [[0,1] [1,0]]

            0<>1

    */
}
