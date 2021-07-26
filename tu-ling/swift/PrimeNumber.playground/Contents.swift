import Foundation

/// 统计 n 以内的素数个数

func isPrime(_ x: Int) -> Bool {
    var i = 2
    while i * i <= x {
        if x % i == 0 {
            return false
        }
        i += 1
    }
    return true
}


func fb(_ n: Int) -> Int {
    var count = 0
    guard n > 1 else {
        return count
    }
    
    for i in 2..<n {
        if isPrime(i) {
            count += 1
        }
    }
    return count
}

/// 解题思路:
/// 合数（非素数）: 4,  6, 8, 。。。
/// 每遍历到一个素数（第一个素数是2），根据该素数找到可能的合数，设置标记位；
/// 下次遍历时跳过合数;
func eratosthense(_ n: Int) -> Int {
    var count = 0
    guard n > 1 else {
        return count
    }
    /// false 素数, 默认是素数
    var isPrime = Array(repeating: false, count: n)
    for i in 2..<n {
        if isPrime[i] == false {
            count += 1
            
            /// j 是合数的标记位
            var j = i * i
            while j < n {
                isPrime[j] = true
                j += i
            }
        }
    }
    return count
}
print(fb(100))
print(eratosthense(100))
