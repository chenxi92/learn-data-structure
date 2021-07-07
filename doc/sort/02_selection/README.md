
**选择排序（Selection sort）** 是一种简单直观的排序算法。

### 算法步骤

1. 首先在数组中找到最小（大）元素，放到数组的起始位置；
2. 从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序数组的末尾；
3. 以此类推直到所有元素排序完毕。

### 动图演示

![选择排序](./images/selectionSort.gif)

### 代码实现

#### swift

`swift` 版本 `5`

```swift
/// 选择排序
///
/// - Parameters:
///   - array: 待排序数组
///   - orderCriteria: 排序条件
/// - Returns: 已经排序数组
static func Sort<T: Comparable>(array: inout [T], _ orderCriteria: (T, T) -> Bool) -> [T] 
{
    guard array.count > 1 else { return array }
    let end = array.count
    for x in 0 ..< end {
        // 每一轮找到 最小/大 元素的下标
        var position = x
        for y in x + 1 ..< end {
            if orderCriteria(array[y], array[position]) {
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



#### Python

```python
def selection_sort(array):
    for i in range(len(array)):
        min = i
        for j in range(i, len(array)):
            if array[j] < array[min]:
                min = j
        if i != min:
            (array[i], array[min]) = (array[min], array[i])
    return array

```



### 性能

时间复杂度: O( n<sup>2</sup> )

空间复杂度: O( n )


### 参考

- [swift-algorighm-club](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Selection%20Sort)
- [选择排序](https://www.runoob.com/w3cnote/selection-sort.html)
- [维基百科](https://zh.wikipedia.org/wiki/选择排序)
