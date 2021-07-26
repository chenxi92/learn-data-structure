import Foundation

/// 整型数组 nums ，在数组中找出由三个数字组成的最大乘积，并输出这个乘积。
/// 乘积不会越界。

///假设全部为正数， 则最大的三个数为最大乘积；
///假设全部为负数， 则最大的三个数为最大乘积；
///假设有3个负数， 则最大的三个数为最大乘积；
///假设有2个负数， 则最小的两个数和最大的一个数为最大乘积；
///假设有1个负数， 则最大的三个数为最大乘积；
func getmax(_ nums: [Int]) -> Int {
    var max1 = Int.min
    var max2 = Int.min
    var max3 = Int.min
    var min1 = Int.max
    var min2 = Int.max
    for x in nums {
        if x < min1 {
            min2 = min1
            min1 = x
        } else if x < min2 {
            min2 = x
        }
        
        if x > max1 {
            max3 = max2
            max2 = max1
            max1 = x
        } else if x > max2 {
            max2 = max1
            max1 = x
        } else if x > max3 {
            max3 = x
        }
    }
    
    return max(min1 * min2 * max1, max1 * max2 * max3)
}

let nums = [-1, 2, 3, 4, 5, 6]
print(getmax(nums))
