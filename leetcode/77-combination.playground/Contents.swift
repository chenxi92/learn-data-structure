import Foundation

/**
 # https://leetcode.com/problems/combinations/

 # Given two integers n and k, return all possible combinations of k
 # numbers out of 1 ... n.
 # You may return the answer in any order.
 # Constraints:
 # 1 <= n <= 20
 # 1 <= k <= n
 */

class Solution {
    func combination(_ n: Int, _ k: Int) -> [[Int]] {
        var ans: [[Int]] = []
        
        func dfs(_ path: inout [Int], _ start: Int, _ end: Int, _ length: Int) {
            if length == 0 {
                ans.append(path)
                print(ans)
                return
            }
            
            if start > end {
                return
            }
            
            for i in start...end {
                path.append(i)
                dfs(&path, i + 1, end, length - 1)
                path.removeLast()
            }
        }
        
        var path: [Int] = []
        dfs(&path, 1, n, k)
        
        return ans
    }
}

print(Solution().combination(4, 2))
