

### 算法简介

快速排序使用[分治法](https://zh.wikipedia.org/wiki/分治法)（Divide and conquer）策略来把一个[序列](https://zh.wikipedia.org/wiki/序列)（list）分为较小和较大的2个子序列，然后递归地排序两个子序列。

步骤为：

1. 挑选基准值：从数列中挑出一个元素，称为“基准”（pivot），
2. 分割：重新排序数列，所有比基准值小的元素摆放在基准前面，所有比基准值大的元素摆在基准后面（与基准值相等的数可以到任何一边）。在这个分割结束之后，对基准值的排序就已经完成，
3. 递归排序子序列：[递归](https://zh.wikipedia.org/wiki/递归)地将小于基准值元素的子序列和大于基准值元素的子序列排序。

递归到最底部的判断条件是数列的大小是零或一，此时该数列显然已经有序。

选取基准值有数种具体方法，此选取方法对排序的时间性能有决定性影响。



### 动图演示

![快速排序](./images/quickSort.gif)



### 代码实现

#### swift

`swift` 版本 `5`

##### [Lomuto 选择基准值](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#lomutos-partitioning-scheme)


```swift
static func SortLomuto<T: Comparable>(_ array: inout [T]) -> [T] {
    SortLomuto(&array, 0, array.count - 1)
    return array
}

static private func SortLomuto<T: Comparable>(_ array: inout [T], _ low: Int, _ high: Int) {
    if low < high {
        let p = partitionLomuto(&array, low: low, high: high)
        SortLomuto(&array, low, p - 1)
        SortLomuto(&array, p + 1, high)
    }
}

static private func partitionLomuto<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
    let pivot = array[high]
    /// 记录基准值的位置，从前往后扫描
    var i = low
    for j in low ..< high {
        if array[j] <= pivot {
            if (i != j) {
                array.swapAt(j, i)
            }
            i += 1
        }
    }
    array.swapAt(i, high)
    return i
}
```

###### Partition 过程举例

假设初始数组是 `8` , `3` , `12` , `7` , `6` , `9` , 初始值 low = 0， high = 5， pivot = 9:

第0次遍历时， j = 0， i= 0， array[0] = 8 小于 9,  j = i = 0 不用交换， i 加 1 后为 1，交换后如下：

```
8		3		12	7		6		9
		i = 1
j = 0
```

第1次遍历时， j = 1, i = 1, array[1] = 3 小于 9,   j = i = 1不用交换， i 加 1 后为 2，交换后如下：

```
8		3		12	7		6		9
				i = 2
		j = 1
```

第2次遍历时， j = 2, i = 2, array[2] = 12 大于 9 不用交换，交换后如下：

```
8		3		12	7		6		9
				i = 2
		    j = 2
```

第3次遍历时， j = 3, i = 2, array[3] = 7 小于 9,  j != i 交换 array[3] 和 array[2]，i 加 1 后为 3, 交换后如下：

```
8		3		7	 12		6		9
				   i = 3
		       j = 3
```

第4次遍历时， j = 4, i = 3, array[4] = 6 小于 9,  j != i 交换 array[4] 和 array[3]，i 加 1 后为 4, 交换后如下：

```
8		3		7	 6	12	 9
				      i = 4
		          j = 4
```

for循环结束， 然后交换 i = 4 和 high = 5 的位置， 交换后：

```
8		3		7	 6	9	 12
```

返回基准值的位置为4




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



##### 同时从左右扫描开始选择基准值值

```swift
static func Sort<T: Comparable>(_ array: inout [T]) -> [T] {
    partitionLeftRight(&array, low: 0, high: array.count - 1)
    return array
}

static private func partitionLeftRight<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
    guard high >= low else {
        return
    }

    var left = low  /// 记录从前往后的扫描位置
    var right = high /// 记录从后往前的扫描位置
    let pivot = array[left] /// 基准值，选择待排序区间的第一个元素
    /// 每一轮, 先从后往前扫，在从前往后扫
    while left < right {
        while (left < right && array[right] >= pivot) {
            right -= 1
        }
        if left < right {
            /// 后面扫描完毕，接着从前开始扫描
            array[left] = array[right]
            left += 1
        }
        while (left < right && array[left] <= pivot) {
            left += 1
        }
        if left < right {
            /// 前面扫描完毕，接着从后开始扫描
            array[right] = array[left]
            right -= 1
        }
    }
  	/// 将基准值放入数组的left位置， 此时left和right相等
    array[left] = pivot

    partitionLeftRight(&array, low: low, high: left - 1)
    partitionLeftRight(&array, low: left + 1, high: high)
}
```



###### Partition 过程举例

假设初始数组是 `8` , `3` , `12` , `7` , `6` , `9` , 初始值 left = low = 0， right = high = 5， pivot = 8:

第1轮先从后扫描，此时 left = 0, right = 5, array[right]  = array[5] = 9 大于 pivot， right 减 1后为 4， 此时数组为：

```
8    3    12    7    6    9
left                 right
```

第2轮接着从后扫描，此时 left = 0, right = 4, array[right]  = array[4]  = 6 小于 pivot，给扫描到的左侧赋值 array[left] = array[0] 赋值为 array[right] = array[4] = 6, left 加 1后为 1， 此时 **从后扫描结束** 数组为：

```
6    3    12    7    6    9
     left            right
```

第3轮接着从前扫描，此时 left = 1, right = 4,  array[left] = array[1] = 3 小于 pivot， left 加 1后为 2， 此时数组为：

```
6    3    12    7    6    9
          left       right
```

第4轮接着从前扫描，此时 left = 2, right = 4, array[left] = array[2] = = 12 大于 pivot，给扫描到的右侧赋值 array[4] = array[2] = 12, right 减 1后为 3， 此时 **从前扫描结束** 数组为：

```
6    3    12    7    12    9
          left  right
```

第5轮接着从后扫描，此时 left = 2, right = 3, array[right]  = array[3] = 7 小于 pivot，给扫描到的左侧赋值 array[left] = array[2] 赋值为 array[right] = array[3] = 7, left 加 1后为 3,  此时 **结束while循环** 数组为：

```
6    3    7    7    12    9
               left  
               right
```

最后将基准值 8 放在 left 即 3 的位置， 此时数组为:

```
6    3    7    8    12    9
```



#### Python

```python
def quick_sort(array):
    partition(array, 0, len(array) - 1)
    return array

def partition(array, low, high):
    """
    array: 待排序数组
    low:   待排序数组起始坐标
    high:  待排序数组结束坐标
    """

    if (low >= high):
        return
    l = low # 记录从前往后的扫描位置
    r = high # 记录从后往前的扫描位置
    pivot = array[l] # 基准值，选择待排序区间的第一个元素
    # 每一轮, 先从后往前扫，在从前往后扫
    while (l < r):
        while (l < r and array[r] >= pivot):
            r -= 1
        if (l < r):
            array[l] = array[r]
            l += 1
        while (l < r and array[l] <= pivot):
            l += 1
        if (l < r):
            array[r] = array[l]
            r -= 1
    
    # 将基准值放入数组的l位
    array[l] = pivot
    print l, array
    partition(array, low, l - 1)
    partition(array, l + 1, high)

def quick_sort_lomuto(array):
    partitionLomuto(array, 0, len(array) - 1)
    return array

def partitionLomuto(array, low, high):
    if low >= high:
        return
    index = low
    pivot = array[high]
    for j in range(low, high):
        if array[j] <= pivot:
            if (j != index):
                array[j] , array[index] = (array[index], array[j])
            index += 1
    (array[index], array[high]) = (array[high], array[index])
    print index, array
    partitionLomuto(array, low, index - 1)
    partitionLomuto(array, index + 1, high)

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


