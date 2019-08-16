


### 算法实现

swift 版本 `5.1`

```swift
func countingSort(_ array: [Int]) -> [Int] {
    let maxElement = array.max() ?? 0

    var countArray = [Int](repeating: 0, count: (maxElement + 1))
    for element in array {
        countArray[element] += 1
    }

    for index in 1..<countArray.count {
        let sum = countArray[index] + countArray[index - 1]
        countArray[index] = sum
    }

    var sortedArray = [Int](repeating: 0, count: array.count)
    for element in array {
        countArray[element] -= 1
        let index = countArray[element]
        print(index)
        sortedArray[index] = element
    }

    return sortedArray
}
```






### 参考

- [swift-algorithm-club](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Counting%20Sort)
- [维基百科](https://zh.wikipedia.org/wiki/计数排序)
- [计数排序](https://zhuanlan.zhihu.com/p/34357887)
