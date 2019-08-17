
**选择排序（Selection sort）** 是一种简单直观的排序算法。

### 算法步骤

1. 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置。
2. 然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
3. 以此类推，直到所有元素均排序完毕

### 动图演示

![选择排序](./../../image/sort/selectionSort.gif)

### 代码实现

#### swift

`swift` 版本 `5.1`

```swift
/// 选择排序
///
/// - Parameters:
///   - array: 待排序数组
///   - isOrderedBefore: 排序条件
/// - Returns: 已经排序数组
func selectionSort<T: Comparable>(array: inout [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else { return array }

    for x in 0 ..< array.count {
      	// 每次循环找到最大或者最小的元素的位置
        var position = x
        for y in x + 1 ..< a.count {
            if isOrderedBefore(array[y], array[x]) {
                position = y
            }
        }
        if x != position {
            array.swapAt(x, position)
        }
    }

    return array
}
```

### 性能

时间复杂度： **O(n^2)**

空间复杂度:  **O(n)**


### 参考

- [swift-algorighm-club](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Selection%20Sort)
- [选择排序](https://www.runoob.com/w3cnote/selection-sort.html)
- [维基百科](https://zh.wikipedia.org/wiki/选择排序)
