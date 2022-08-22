/**
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/
 
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 Find the maximum profit you can achieve. You may complete at most two transactions.

 Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

 */
import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buyOne: Int = Int.max
        var sellOne: Int = 0
        var buyTwo: Int = Int.max
        var sellTwo: Int = 0
        
        for price in prices {
            buyOne = min(buyOne, price)
            sellOne = max(sellOne, price - buyOne)
            
            buyTwo = min(buyTwo, price - sellOne)
            sellTwo = max(sellTwo, price - buyTwo)
        }
        return sellTwo
    }
}

let prices1 = [3, 3, 5, 0, 0, 3, 1, 4]
let prices2 = [1, 2, 3, 4, 5]
let prices3 = [7, 6, 4, 3, 1]

let except1 = 6
let except2 = 4
let except3 = 0

let profit1 = Solution().maxProfit(prices1)
let profit2 = Solution().maxProfit(prices2)
let profit3 = Solution().maxProfit(prices3)

assert(profit1 == except1, "except \(except1), but return \(profit1)")
assert(profit2 == except2, "except \(except2), but return \(profit2)")
assert(profit3 == except3, "except \(except3), but return \(profit3)")

print("--- passed test")
