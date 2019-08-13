



#### 算法步骤

1. 把第一个元素当做有序数组， 把第二个原色到最后一个元素当做无序数组；
2. 从头到尾一次扫描无序数组，将扫描到的每一个元素插入到有序数组的适当位置。如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面。）



#### 动图演示

![动图演示](/image/sort/insertionSort.gif)


### 代码实现



### swift

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



#### 参考链接

- [十大经典排序算法](https://github.com/hustcc/JS-Sorting-Algorithm/blob/master/3.insertionSort.md)
- [插入排序](https://aquarchitect.github.io/swift-algorithm-club/Insertion%20Sort/)
- [维基百科](https://en.wikipedia.org/wiki/Insertion_sort)
