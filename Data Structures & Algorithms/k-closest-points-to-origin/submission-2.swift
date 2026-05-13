import Collections 


class Solution {
    struct Point: Comparable {
        let x: Int
        let y: Int

        var distance: Double {
            return (pow(Double(x), 2.0) + pow(Double(y), 2.0)).squareRoot()
        }

        init(_ pointArray: [Int]) {
            self.x = pointArray[0]
            self.y = pointArray[1]
        }

        static func <(lhs: Point, rhs: Point) -> Bool {
            return lhs.distance < rhs.distance
        }
    }

    /*
        [[0,2],[2,0],[2,2]], k = 2

        [[0,2] [2,0]]

        [[0,2],[2,0],[0,1]], k = 2

        [[0,1] [2,0]]
    */

    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var heap = Heap<Point>()

        for pointArray in points {
            let point = Point(pointArray)

            if heap.count < k {
                heap.insert(point)
            } else {
                if let max = heap.max, max.distance > point.distance {
                    _ = heap.popMax()
                    heap.insert(point)
                }
            }
        }

        var ans = [[Int]]()

        while let maxPoint = heap.popMax() {
            ans.append([maxPoint.x, maxPoint.y])
        }

        return ans
    }

    /* 
        k closest means amongst the k closest points, which one is the furthest
            so we could use a max heap that has the k closest points

            inserting/popping minheap is be logk, since we just need to maintain a heap of size k
            we'll be doing this for all num in nums, aka n ... so total is 
                O(nlogk) time
                O(k) space
    */
}
