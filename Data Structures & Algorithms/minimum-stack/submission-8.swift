class MinStack {

    /*
    Use one stack for push/pop/top

    Another one just for getMin

    */

    private var stack: [Int] = []
    private var minStack: [Int] = []

    init() {}

    func push(_ val: Int) {
        stack.append(val)
        minStack.append(min(stack.last!, minStack.last ?? val))
    }

    func pop() {
        _ = stack.popLast()
        _ = minStack.popLast()
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        // return stack.reduce(Int.max) { min($0, $1) }
        // return stack.min()!
        return minStack.last!
    }
}
