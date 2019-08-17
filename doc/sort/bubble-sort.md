
**冒泡排序（英语：Bubble Sort）** 是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。

### 算法步骤

1. 比较相邻的元素。如果第一个比第二个大，就交换他们两个。
2. 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
3. 针对所有的元素重复以上的步骤，除了最后一个。
4. 持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。

### 动图演示

![冒泡排序](./../../image/sort/bubbleSort.gif)


### 代码实现

#### swift

`swift` 版本 `5.1`

```swift
/// 冒泡排序
///
/// - Parameters:
///   - array: 待排序数组
///   - isOrderdBefore: 排序条件
/// - Returns: 已经排序数组
func bubbleSort<T: Comparable>(array: inout [T], _ isOrderdBefore:(T, T) -> Bool) -> [T] {
        for i in 0 ..< array.count {
            // 当遍历 i 次之后，已经有 i 个元素有序排序，无需对这些元素再次排列
            for j in 1 ..< array.count - i { 
                if isOrderdBefore(array[j], array[j - 1]) {
                    array.swapAt(j, j - 1)
                }
            }
        }
        return array
    }
```

### 性能

时间复杂度: O(n^2)

空间复杂度: O (n)




### 参考

- [swift-algorithm-club](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Bubble%20Sort)
- [冒泡排序](https://www.runoob.com/w3cnote/bubble-sort.html)

