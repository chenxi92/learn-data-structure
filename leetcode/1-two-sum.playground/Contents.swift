import Foundation


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int : Int] = [:]
        for (index, value) in nums.enumerated() {
            let other = target - value
            if let otherIndex = map[other] {
                return [index, otherIndex]
            }
            map[value] = index
        }
        return [-1, -1]
    }
}

print(Solution().twoSum([2, 7, 11, 15], 9))
print(Solution().twoSum([2, 7, 11, 15], 91))

