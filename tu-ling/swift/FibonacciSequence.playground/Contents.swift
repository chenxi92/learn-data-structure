import Foundation

/// > 求取斐波那契数列的第N位值。
/// 斐波那契数列：每一位的值等于他前面两位数字之和， 前两位固定位 0， 1。
///  0， 1， 1， 2， 3， 5， 8，  13， 21， 34， 55 ...


func printTimeElapsedWhenRuningCode(_ title: String, _ operation: () -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElasped = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elasped for \(title): \(timeElasped)")
}

func solution1(_ num: Int) -> Int {
    if num == 0 {
        return 0
    }
    if num == 1 {
        return 1
    }
    return solution1(num - 1) + solution1(num - 2)
}

func solution2(_ num: Int) -> Int {
    var array = Array(repeating: 0, count: num + 1)
    return recursion(num, &array)
}

func recursion(_ num: Int, _ array: inout [Int]) -> Int {
    if num == 0 {
        return 0
    }
    if num == 1 {
        return 1
    }
    if array[num] != 0 {
        return array[num]
    }
    array[num] = recursion(num - 1, &array) + recursion(num - 2, &array)
    return array[num]
}

func solution3(_ num: Int) -> Int {
    if num == 0 {
        return 0
    }
    if num == 1 {
        return 1
    }
    var low = 0
    var high = 1
    for _ in 2...num {
        let sum = low + high
        low = high
        high = sum
    }
    return high
}

let num = 20
printTimeElapsedWhenRuningCode("use recursion") {
    let result = solution1(num)
    print(result)
}
printTimeElapsedWhenRuningCode("use recursion and delete duplicates") {
    let result = solution2(num)
    print(result)
}
printTimeElapsedWhenRuningCode("use two pointers") {
    let result = solution3(num)
    print(result)
}

