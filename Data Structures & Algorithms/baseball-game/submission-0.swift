class Solution {
    func calPoints(_ operations: [String]) -> Int {
        var record = [Int]()

        for op in operations {
            if let int = Int(op) {
                record.append(int)
            } else if op == "+", record.count >= 2 {
                let (a, b) = (record[record.count - 1], record[record.count - 2])
                record.append(a + b)
            } else if op == "C" {
                record.popLast()
            } else if op == "D", let lastNum = record.last {
                record.append(2 * lastNum)
            }
        }

        return record.reduce(0) {
            $0 + $1
        }
    }
}
