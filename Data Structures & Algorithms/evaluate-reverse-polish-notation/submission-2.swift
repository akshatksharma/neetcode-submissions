class Solution {

    /*
    breakdown
    - array of strings for commands in polish notation
        how long -> at least 1
        what kind of chars?: integers, +|-|*|/
        integer division?


        [1, 2, *, 4, -] = (1 * 2) - 4

        [1] -> 1

        [1, 2, *] -> 2


    - approach
        we expand expression inwards out 
        like we first do 1 * 2, then the -4
        
        so we can use a stack ... 
            when it's a num we add to the stack
            when it's an op we pop 2 things off, do the operation, then add to the stack

    */

    func evalRPN(_ tokens: [String]) -> Int {
        var answer = 0
        var stack = [Int]()

        guard tokens.count > 0 else { return 0 }
        guard tokens.count > 1 else { return Int(tokens[0]) ?? answer }

        for token in tokens {
            if let intVal = Int(token) {
                stack.append(intVal)
            } else {
                guard let operandB = stack.popLast(), let operandA = stack.popLast() else { return -1 }
                switch token {
                    case "+":
                        answer = operandA + operandB
                    case "*":
                        answer = operandA * operandB
                    case "-":
                        answer = operandA - operandB
                    case "/":
                        answer = operandA / operandB
                    default:
                        return -1
                }
                stack.append(answer)
            }
        }

        return answer
    }
}
