class Solution {

    /*
    - 2 arrays
        position is position of ith car
        speed is speed of ith car
    - target

    cars cannot pass cars ahead, can only match

    fleet is some # of cars that travel at same pos/speed (can be 1)


    target = 10
    [1, 2]
    [3, 2]

    - car can only join a fleet if itll make it to the end faster
        can figure out the time to the end by doing (10 - position[i]) / speed[i]
        (10 - 1) / 3 = 3, (10 - 2) / 2 = 4 ... car 0 would reach before car 1 so they'll be one fleet

    target = 10
    [1, 2, 2]
    [3, 4, 2]
    (10 - 1) / 3 = 3
    (10 - 2) / 4 = 2 
    (10 - 2) / 2 = 4
    --> 1 fleet

    target = 10
    [1, 2, 2]
    [3, 2, 4]

    [(2, 4), (2, 2), (1, 3)]

    (10 - 2) / 4 = 2
    (10 - 2) / 2 = 4
    (10 - 1) / 3 = 3


    [2, 4]

    target = 10
    [1]
    [3]


    pair arrays up, sort by position

    use stack to track current slowest fleet
        if stack empty add current car
        if current car slower than stack's top, then add to stack (since it'll be a new fleet)
        if current car faster than stack's top, then ignore since it'll just join that fleet
    */



    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let cars = zip(position, speed).sorted { $0.0 >= $1.0 }

        var numFleets = 1
        var currentFleet = cars[0]
        var currentFleetTimeRemaining = Double((target - currentFleet.0)) / Double(currentFleet.1)

        for (position, speed) in cars {
            let timeRemaining = Double((target - position)) / Double(speed)

            if timeRemaining > currentFleetTimeRemaining {
                numFleets += 1
                currentFleetTimeRemaining = timeRemaining
            } else {
                continue // the new car will join the fleet
            }
        }

        return numFleets
    }
}
