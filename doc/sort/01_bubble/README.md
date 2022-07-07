**冒泡排序（英语：Bubble Sort）** 是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。

### 算法步骤

1. 比较相邻的元素，如果第一个比第二个大，就交换他们；
2. 对每一对相邻元素作同样的工作，从开始的第一对到结尾的最后一对(这步做完后，最后的元素会是最大的数)；
3. 针对所有的元素重复以上的步骤，除了最后一个；
4. 持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。

### 动图演示

![冒泡排序](./images/bubbleSort.gif)


### 代码实现

#### swift

`swift` 版本 `5.1`

```swift
/// 冒泡排序
///
/// - Parameters:
///   - array: 待排序数组
///   - orderCriteria: 排序条件, < 升序， < 降序
/// - Returns: 已经排序数组
static func sort<T: Comparable>(array: inout [T], _ orderCriteria:(T, T) -> Bool) -> [T] 
{
    for end in stride(from: array.count - 1, through: 1, by: -1) {
        for begin in 1 ... end {
            if orderCriteria(array[begin], array[begin - 1]) {
                array.swapAt(begin, begin - 1)
            }
        }
    }  
    return array
}
```



#### Python

```python
def bubble_sort(array):
    for i in range(len(array)):
        ordered = True
        end = len(array) - i - 1
        for j in range(end):
            if j + 1 < len(array) and array[j] > array[j + 1]:
                (array[j], array[j + 1]) = (array[j + 1], array[j])
                ordered = False
        if ordered is True:
            break
    return array
```



### 性能

时间复杂度: O( n<sup>2</sup> )

空间复杂度: O( 1 )




### 参考

- [swift-algorithm-club](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Bubble%20Sort)
- [冒泡排序](https://www.runoob.com/w3cnote/bubble-sort.html)

