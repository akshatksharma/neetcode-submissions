class Solution {
func trap(_ height: [Int]) -> Int {
    if height.count < 3 { return 0 }
    
    let n = height.count
    
    var maxLefts = Array(repeating: 0, count: n)
    for i in 1..<n {
        maxLefts[i] = max(maxLefts[i-1], height[i-1]) // check if the current val to our left is the largest val to our left
    }
    
    var maxRights = Array(repeating: 0, count: n)
    for i in stride(from: n-2, through: 0, by: -1) {
        maxRights[i] = max(maxRights[i+1], height[i+1]) // same for the right
    }
    
    var water = 0
    for i in 0..<n {
        let waterLevel = min(maxLefts[i], maxRights[i])
        water += max(0, waterLevel - height[i])
    }
    
    return water
}
}
