class Solution {
func trap(_ height: [Int]) -> Int {
    if height.count < 3 { return 0 }
    
    let n = height.count
    
    // maxLefts[i] = max height strictly to the LEFT (indices 0 to i-1)
    var maxLefts = Array(repeating: 0, count: n)
    for i in 1..<n {
        maxLefts[i] = max(maxLefts[i-1], height[i-1])
    }
    
    // maxRights[i] = max height strictly to the RIGHT (indices i+1 to n-1)
    var maxRights = Array(repeating: 0, count: n)
    for i in (0..<n-1).reversed() {
        maxRights[i] = max(maxRights[i+1], height[i+1])
    }
    
    var water = 0
    for i in 0..<n {
        let waterLevel = min(maxLefts[i], maxRights[i])
        water += max(0, waterLevel - height[i])  // ← Need this guard!
    }
    
    return water
}
}
