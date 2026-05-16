class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var allParentheses = [String]()
        var currentParentheses = [Character]() // needs to be 2n

        func backtrack(_ numOpen: Int, _ numClosed: Int) {
            if numClosed < numOpen {
                return
            }

            if numOpen == 0 && numClosed == 0 {
                allParentheses.append(String(currentParentheses))
                return
            }

            if numOpen > 0 {
                currentParentheses.append("(")
                backtrack(numOpen-1, numClosed)
                currentParentheses.popLast()
            }

            if numClosed > 0 {
                currentParentheses.append(")")
                backtrack(numOpen, numClosed-1)
                currentParentheses.popLast()
            }
        }

        backtrack(n, n)

        return allParentheses
    }
}

/*
    n = 1
    ()

    n = 2

    n = 3
    ...


    approach
        brute force / backtracking
            we can either put the parenthesis in the current element
            or we can append to our currentlist

            either of these increments our "count"

            when count == n, then we append to global array 
            and backtrack back (undo it)

            <= O(2^n)

                n = 3

                    ()

                (())      ()()

                         ()(())       ()()()

*/
