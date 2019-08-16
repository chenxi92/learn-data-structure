#### 算法简介

1. 把数组第一个元素当做有序部分， 把第二个元素到最后一个元素当做无序部分；
2. 从头到尾遍历无序部分，将扫描到的每一个元素插入到有序部分的适当位置；
3. 重复步骤2，知道无序部分为空。


#### 动图演示

![动图演示](./../../image/sort/insertionSort.gif)


#### 代码实现



#### swift

`Swift`  版本 `5.1` 

```swift
import Foundation

/// 插入排序
///
/// - Parameters:
///   - array: 待排序数组
///   - isOrderdBefore: 排序方法
/// - Returns: 已经排序数组
func insertionSort<T>(_ array: [T], _ isOrderdBefore: (T, T) -> Bool) -> [T] {
        var a = array
        for x in 1 ..< a.count {
            var y = x
            let temp = a[y]
            while y > 0 && isOrderdBefore(temp, a[y - 1]) {
                a[y] = a[y - 1]
                y -= 1
            }
            a[y] = temp
        }
        
        return a
    }
```



#### 性能

平均和最坏的时间复杂度: O(n^2) , 因为有两层嵌套来遍历。当数组规模比较小的时候很有效。

空间复杂度 O(1) 。

优点:

- 实现简单；
- 相同元素不改变其相对位置；
- 在原数组内修改位置，不产生而外的开销；


#### 参考链接

- [十大经典排序算法](https://github.com/hustcc/JS-Sorting-Algorithm/blob/master/3.insertionSort.md)
- [插入排序](https://aquarchitect.github.io/swift-algorithm-club/Insertion%20Sort/)
- [维基百科](https://en.wikipedia.org/wiki/Insertion_sort)
