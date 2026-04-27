class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
         guard nums.count > 0 else { return -1 }

         var maxProd = 1
         var minProd = 1
         var ans = nums[0]

         for num in nums {
            let newMaxProd = max(maxProd * num, minProd * num, num)
            let newMinProd = min(maxProd * num, minProd * num, num)

            maxProd = newMaxProd
            minProd = newMinProd

            ans = max(maxProd, ans)
         }

        return ans
    }
    /*
        [2, 2, -5, 10]

    max: 2 4  4  10
    min: 2 2 -20  -50

    [2, 2, -5, -10]
    max: 2 4  4  200
    min: 2 2 -20  -20

    maintain the max product and min product 
        compare the maxProduct * num, minProduct * num, and num

            maxProduct * num -> covers the case when our rolling product is positive
            minProduct * num -> covers the case when our rolling product is negative
            num -> covers when our immediate number is bigger and we should pick that array instead

        do the same thing for the max and min product, but check max and min respectively

    */
}
