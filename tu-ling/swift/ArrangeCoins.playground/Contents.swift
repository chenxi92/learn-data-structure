import Foundation

/// 总共有 n 枚硬币，将他们摆成一个阶梯形状，第 k 行就必须正好有 k 枚硬币。
/// 给定一个数字 n， 找出可形成完整阶梯的总行数。
/// n 是一个非负整数，并且在 32 位有符号整型的范围内。


/// 暴力破解
///
/// 从第一行开始遍历， 每遍历一次找出剩下的总硬币数量，并判断当前是否能够组成第 k 行；
func solution1(_ num: Int) -> Int {
    guard num > 0 else {
        return 0
    }
    
    var n = num
    for i in 1...n {
        n -= i
        if n <= i {
            return i
        }
    }
    return 0
}

/// 二分查找法
///
/// 找到从 low 到 mid 之间所有的硬币总数 cost  `k*(k + 1)/2`， 并与 n 比较，直到取到合适的 mid 或者 退出遍历；
func solution2(_ num: Int) -> Int {
    guard num > 0 else {
        return 0
    }
    
    var low = 0
    var high = num
    while low <= high {
        let mid = low + (high - low) / 2
        let cost = mid * (mid + 1) / 2
        if cost == num {
            return mid
        } else if cost > num {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return high
}

/// 牛顿迭代
///
/// 假设 x 的平方根为 n， 则 `n = x / n`,  且 `x / n`  和 `n` 的均值比他们两个更加趋近于 `n` 。
/// 不断对 n 进行求值，最后得到平方根。
///
/// 假设满足的硬币有k行，则`k * ( k + 1) / 2 = n`  ，可以推导出  `k^2 = 2 * n - k` ，把它带入到牛顿迭代的公式中即可求出值。
func solution3(_ num: Int) -> Int {
    guard num > 0 else {
        return 0
    }
    return _sqrt(num, num)
}

func _sqrt(_ x: Int, _ n: Int) -> Int {
    let res = (x + (2 * n - x) / x) / 2
    if res == x {
        return x
    }
    return _sqrt(res, n)
}

let n = 11
print(solution1(n))
print(solution2(n))
print(solution3(n))
