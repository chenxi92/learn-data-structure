import Foundation

class Solution {
    func numDecodings(_ s: String) -> Int {
        let decodeArray: [Character] = Array(s)
        if decodeArray[0] == "0" {
            return 0
        }
        var dp: [Int] = Array(repeating: 0, count: decodeArray.count)
        dp[0] = 1
        for i in 1..<decodeArray.count {
            let cur = Int(String(decodeArray[i]))!
            if cur >= 1 && cur <= 9 {
                dp[i] += dp[i - 1]
            }
            let prev = Int(String(decodeArray[i - 1]))!
            if (prev == 1 && cur >= 0 && cur <= 9) || (prev == 2 && cur >= 0 && cur <= 6) {
                // 10 ~ 19 , 20 ~ 26
                if i >= 2 {
                    dp[i] += dp[i - 2]
                } else {
                    dp[i] += 1
                }
            }
        }
        return dp[decodeArray.count - 1]
    }
}

print(Solution().numDecodings("112"))
