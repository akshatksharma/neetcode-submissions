class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        // build up adj list and other things
        var adjList = Array(repeating: Set<Int>(), count: numCourses)
        var indegrees = Array(repeating: 0, count: numCourses)
        var hasPrereq = Array(repeating: Set<Int>(), count: numCourses)

        for prereq in prerequisites {
            adjList[prereq[0]].insert(prereq[1])
            indegrees[prereq[1]] += 1
        }

        var queue = [Int]()
        for course in 0..<numCourses {
            if indegrees[course] == 0 {
                queue.append(course)
            }
        }

        while !queue.isEmpty {
            let course = queue.removeFirst()

            for dep in adjList[course] {
                hasPrereq[dep].insert(course)
                hasPrereq[dep].formUnion(hasPrereq[course])

                indegrees[dep] -= 1
                if indegrees[dep] == 0 {
                    queue.append(dep)
                }
            }
        }

        let answer = queries.map { query in
            hasPrereq[query[1]].contains(query[0])
        }

        return answer
    }

    /*
        ai -> bi -> ci
              -> di

        ei

        - are we guaranteed that this is a DAG? what if we have some weird scenario where
        2 courses depend on each other -> return false
        - not all the courses are connected

        we can build a set of each course to it's prereqs by going through topological order
            kahn's algorithm
        then for each query, we can see if uj is in the prereq set

        time:
            building up the adjlist will be O(V+E)
            kahn's: O(V+E)



    */
}
