/**
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
 
 You are given an integer array prices where prices[i] is the price of a given stock on the ith day.

 On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.

 Find and return the maximum profit you can achieve.
 */
import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var i = 0
        var buy = 0
        var sell = 0
        var profit = 0
        let count = prices.count - 1
        while i < count {
            while i < count && prices[i + 1] <= prices[i] {
                i += 1
            }
            buy = prices[i]
            print(" buy at \(i) with price: \(prices[i])")
            
            while i < count && prices[i + 1] > prices[i] {
                i += 1
            }
            sell = prices[i]
            print("sell at \(i) with price: \(prices[i]), profit = \(sell - buy)")
            
            profit += (sell - buy)
        }
        return profit
    }
}

let prices1 = [7, 1, 5, 3, 6, 4]
let profit1 = Solution().maxProfit(prices1)
assert(profit1 == 7, "excepted 7, but return \(profit1)")
print("\n")

let prices2 = [1, 2, 3, 4, 5]
let profit2 = Solution().maxProfit(prices2)
assert(profit2 == 4, "excepted 4, but return \(profit2)")
print("\n")

let prices3 = [7, 6, 4, 3, 1]
let profit3 = Solution().maxProfit(prices3)
assert(profit3 == 0, "excepted 0, but return \(profit3)")
print("\n")
print("\n--- passed test")







