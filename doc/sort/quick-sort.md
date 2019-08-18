

### 算法简介

快速排序使用[分治法](https://zh.wikipedia.org/wiki/分治法)（Divide and conquer）策略来把一个[序列](https://zh.wikipedia.org/wiki/序列)（list）分为较小和较大的2个子序列，然后递归地排序两个子序列。

步骤为：

1. 挑选基准值：从数列中挑出一个元素，称为“基准”（pivot），
2. 分割：重新排序数列，所有比基准值小的元素摆放在基准前面，所有比基准值大的元素摆在基准后面（与基准值相等的数可以到任何一边）。在这个分割结束之后，对基准值的排序就已经完成，
3. 递归排序子序列：[递归](https://zh.wikipedia.org/wiki/递归)地将小于基准值元素的子序列和大于基准值元素的子序列排序。

递归到最底部的判断条件是数列的大小是零或一，此时该数列显然已经有序。

选取基准值有数种具体方法，此选取方法对排序的时间性能有决定性影响。



### 动图演示

![快速排序](./../../image/sort/quickSort.gif)

### 代码实现

#### swift

`swift` 版本 `5.1`

##### Lomuto 选择基准值

```swift
func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]
    var pivotIndex = low
    for j in low ..< high {
        if a[j] <= pivot {
            (a[pivotIndex], a[j]) = (a[j], a[pivotIndex])
            pivotIndex += 1
        }
    }
    (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])
    return pivotIndex
}

func quicksortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
      	// 获取基准值
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: p - 1)
        quicksortLomuto(&a, low: p + 1, high: high)
    }
}
```





##### 随机选择基准值

```swift
/// 快速排序
///
/// - Parameters:
///   - array: 待排序数组
///   - isReverse: 是否颠倒排序，true 倒序， false 正xu
/// - Returns: 排序之后数组
func quickSort<T: Comparable>(_ array: [T], _ isReverse: Bool) -> [T] {
    guard array.count > 1 else { return array }

    var left = [T]()
    var right = [T]()
    var middle = [T]()
  	// 随机选择基准值
    let pivot = array.randomElement()!
    for item in array {
        if item == pivot {
            middle.append(item)
        } else if item < pivot {
            left.append(item)
        } else {
            right.append(item)
        }
    }
    if isReverse {
        return quickSort(right, isReverse) + middle + quickSort(left, isReverse)
    }
    return quickSort(left, isReverse) + middle + quickSort(right, isReverse)
}
```



### 性能

最坏时间复杂度: O(n^2)

最优时间复杂度: O(n log n)

平均时间复杂度: O(n log n)



空间复杂度: 根据实现方式的不同而不同



### 参考

[维基百科](https://zh.wikipedia.org/wiki/快速排序)

[swift-algorithm-club](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort)

[快速排序](https://www.runoob.com/w3cnote/quick-sort-2.html)


