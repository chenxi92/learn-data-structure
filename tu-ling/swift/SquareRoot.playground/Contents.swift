import Foundation

/// 在不适用 sqrt(x) 函数的情况下，得到 x 的平方根的整数部分；

func binarySearch(_ x: Int) -> Int {
    var index = -1
    var left = 0
    var right = x
    while left <= right {
        let mid = left + (right - left) / 2
        if mid * mid <= x{
            index = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return index
}

/// 假设 x 的平方根为 n， 则 `n = x / n`,
/// 且 `x / n`  和 `n` 的均值比他们两个更加趋近于 `n` 。
/// 不断对 n 进行求值，最后得到平方根。
func newton(_ x: Int) -> Int {
    return sqrt(x, x)
}

func sqrt(_ i: Int, _ x: Int) -> Int {
    let res = Float(i + x / i) / 2
    if Int(res) == i {
        return Int(res)
    } else {
        return sqrt(Int(res), x)
    }
}

print(binarySearch(20))
print(newton(20))
