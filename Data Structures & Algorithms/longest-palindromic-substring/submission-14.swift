class Solution {
    func longestPalindrome(_ s: String) -> String {
        var s = Array(s)
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        
        var startIdx = 0
        var endIdx = 0

        for i in stride(from: s.count-1, through: 0, by: -1) {
            for j in i..<s.count {
                if s[i] == s[j] {
                    if j - i <= 2 { // (base case) if we have equal chars and the gap is less than or eq to 2, then it's automatically a palindrome
                        dp[i][j] = true
                    } else if dp[i+1][j-1] { // else if the interior is a palindrome
                        dp[i][j] = true
                    }

                    if dp[i][j] { // if we have a valid palindrome, lets track the indexes
                        if j - i > endIdx - startIdx {
                            startIdx = i
                            endIdx = j
                        }
                    }
                } 
            }
        }


        return String(s[startIdx...endIdx])
    }
}

/*

        abavdbdv
        
            v
            d v
            b d v
            d b d v
            v d b d v

        ababdad



brute force O(N^3)
    generate every substring -> O(N^2)
    for each, check if it's a palindrome -> O(N)

optimized
    we can build the substrings from small to large 
    for a given substring from i ... j, we have a palindrome if
        nums[i] == nums[j], dp[i+1][j-1] is true


        F(i,j) tracks if we have a palindrome between i and j

            F(i,j) = nums[i] == nums[j] && F(i+1, j-1)
                base case F(i,j) = 1 when i == j


        we can try all the substrings start starting from the end 
        and then try all substring end from there till the end

        that way we start smaller one

        if we have a valid palindrome, we track the start and end
        of the window and compare to the largest one so far 


        O(N^2) substrings ... O(1) to figure out if it's a palindrome

*/
