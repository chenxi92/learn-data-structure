

**希尔排序**，也称**递减增量排序算法**，是[插入排序](https://zh.wikipedia.org/wiki/插入排序)的一种更高效的改进版本，能够更大间隔的比较和交换元素。

希尔排序是非稳定排序算法。

希尔排序是基于插入排序的以下两点性质而提出改进方法的：

- 插入排序在对几乎已经排好序的数据操作时，效率高，即可以达到[线性排序](https://zh.wikipedia.org/w/index.php?title=線性排序&action=edit&redlink=1)的效率

- 但插入排序一般来说是低效的，因为插入排序每次只能将数据移动一位

  

### 算法步骤

定义待排序的数组 `[64, 20, 50, 33, 72, 10, 23, -1, 4]`,  从小到大排序：

- 第1次确定间隔为 `9/2 = 4` , 对数组的元素每间隔 4 个做一次插入排序
  - 元素 `64`, `72` , `4` 做插入排序
  - 元素 `20`, `10` 做插入排序
  - 元素 `50`, `23` 做插入排序
  - 原色 `33`, `-1` 做插入排序

- 第一轮排序完成，数组为 `[ 4, 10, 23, -1, 64, 20, 50, 33, 72 ]`
- 第2次确定间隔为 `4/2 = 2`, 对数组的元素每间隔 2 个做一次插入排序
  - 元素 `4` , `23` , `64` , `50` , `72` 做插入排序
  - 元素 `10`, `-1` , `20` , `33` 做插入排序

- 第二轮排序完成，数组为 `[ 4, -1, 23, 10, 50, 20, 64, 33, 72 ]`

- 第3次确定间隔为 `2/2 = 1`, 对数组的元素每间隔 1 个做一次插入排序 (此时数组已经 **基本有序**)

- 第三轮排序完成，数组为 `[ -1, 4, 10, 20, 23, 33, 50, 64, 72 ]`

### 动图演示

![希尔排序](./images/shell-sorting.gif)



### 代码实现

#### swift

`swift` 版本 `5`

```swift
static func Sort<T: Comparable>(array: inout [T], _ orderCriteria: (T, T) -> Bool) -> [T]
{
    guard array.count > 1 else {
        return array
    }
    let count = array.count
    var gap = count/3
    while gap > 0 {
        for (i, element) in array.enumerated() {
            var begin = i
            while (begin >= gap) && orderCriteria(element, array[begin - gap]) {
                array.swapAt(begin, begin - gap)
                begin -= gap
            }
        }
        if gap == 2 {
            gap = 1
        } else {
            gap /= 3
        }
    }
    return array
}
```

#### Python

```python
def shell_sort(array):
    count = len(array)
    if count < 1:
        return array
    gap = count/2
    while gap > 0:
        for i in range(count):
            begin = i
            while (begin >= gap) and (array[begin - gap] > array[begin]):
                (array[begin - gap], array[begin]) = (array[begin], array[begin - gap])
                begin -= gap
        gap /= 2
    return array
```



### 性能

时间复杂度：最坏时间复杂度 O(n long n)

空间复杂度：O(n)



### 参考

[Sorting algorithms](http://rosettacode.org/wiki/Sorting_algorithms/Shell_sort)

[维基百科](https://zh.wikipedia.org/wiki/希尔排序)

[浙江大学-数据结构-公开课](https://www.bilibili.com/video/av18586085/?p=107)



