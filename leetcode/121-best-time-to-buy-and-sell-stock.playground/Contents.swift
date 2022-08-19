/**
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 */
import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        for (i, buy) in prices.enumerated() {
            for j in i..<prices.count {
                let sell = prices[j]
                profit = max(profit, sell - buy)
            }
        }
        return profit
    }
    
    func maxProfit1(_ prices: [Int]) -> Int {
        var maxCur = 0
        var maxSoFar = 0
        for i in stride(from: 1, to: prices.count, by: 1) {
            maxCur += prices[i] - prices[i - 1]
            maxCur = max(0, maxCur)
            maxSoFar = max(maxSoFar, maxCur)
        }
        print(maxCur, maxSoFar)
        return maxSoFar
    }
    
    func maxProfit2(_ prices: [Int]) -> Int {
        var lsf = Int.max // least so far
        var op = 0 // overall profit
        var pist = 0 // profit if sold today
        for i in 0..<prices.count {
            if prices[i] < lsf {
                lsf = prices[i]
            }
            pist = prices[i] - lsf
            if op < pist {
                op = pist
            }
        }
        return op
    }
}

let prices1 = [7, 1, 5, 3, 6, 4]
let prices2 = [7,6,4,3,1]

let profit1 = Solution().maxProfit(prices1)
assert(profit1 == 5, "excepted 5, but return \(profit1)")
let profit2 = Solution().maxProfit(prices2)
assert(profit2 == 0, "excepted 5, but return \(profit2)")
print("--- passed test violent solution")

let profit11 = Solution().maxProfit1(prices1)
assert(profit11 == 5, "excepted 5, but return \(profit11)")
let profit22 = Solution().maxProfit1(prices2)
assert(profit22 == 0, "excepted 5, but return \(profit22)")
print("--- passed test kadane's algorithm")

let profit111 = Solution().maxProfit2(prices1)
assert(profit111 == 5, "excepted 5, but return \(profit111)")
let profit222 = Solution().maxProfit2(prices2)
assert(profit222 == 0, "excepted 5, but return \(profit222)")
print("--- passed test for loop")
