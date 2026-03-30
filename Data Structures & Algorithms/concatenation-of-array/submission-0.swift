class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {

        let k = 2
        var out: [Int] = []

        for i in 0..<k {
            for num in nums {
                out.append(num)
            }
        }

        return out
    }
}
