class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
         guard nums.count > 0 else { return -1 }

         var maxProd = nums[0]
         var minProd = nums[0]
         var ans = maxProd

         var currStartIdx = 0 
         var maxStartIdx = 0 
         var maxEndIdx = 0

         for i in 1..<nums.count {
            let num = nums[i]

            let maxFromPrev = maxProd * num
            let maxFromMin = minProd * num

            if num > maxFromPrev && num > maxFromMin {
                currStartIdx = i
            }
            
            let newMaxProd = max(maxFromPrev, maxFromMin, num)
            let newMinProd = min(maxFromPrev, maxFromMin, num)

            maxProd = newMaxProd
            minProd = newMinProd
            
            if maxProd > ans {
                ans = maxProd
                maxStartIdx = currStartIdx
                maxEndIdx = i
            }

            ans = max(maxProd, ans)
         }

        print("range: [\(maxStartIdx), \(maxEndIdx)]")

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
