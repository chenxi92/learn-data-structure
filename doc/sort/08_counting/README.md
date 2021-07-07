**计数排序（Counting sort）** 是一种稳定的[线性时间](https://zh.wikipedia.org/wiki/線性時間)[排序算法](https://zh.wikipedia.org/wiki/排序算法)。该算法于1954年由 Harold H. Seward 提出。计数排序使用一个额外的数组 C ，其中第i个元素是待排序数组 A 中值等于 i 的元素的个数。然后根据数组 C 来将 A 中的元素排到正确的位置。



#### 算法简介

1. 找到待排序数组 A 的最大值 `maxElement`；
2. 创建一个新数组 B ，数组 B 的元素个数为 `maxElement` + 1;
3. 在数组 B 中确定数组 A 的每个元素之前应该放置的元素数量（根据步骤2的结果）;
4. 将数组 A 的每个元素 i 放在新数组的第 B[i] 项，每放一个元素就将 B[i] 减去`1` ；



#### 举例

原始数组

| 下标 | 0    | 1    | 2    | 3    | 4    | 5    | 6    | 7    |
| :--- | :--- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 元素 | 7    | 3    | 5    | 8    | 6    | 7    | 4    | 5    |

countsArray 数组

| 下标 | 0    | 1    | 2    | 3    | 4    | 5    | 6    | 7    | 8    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 元素 | 0    | 0    | 0    | 1    | 1    | 2    | 1    | 2    | 1    |

排序后数组

| 下标 | 0    | 1    | 2    | 3    | 4    | 5    | 6    | 7    |
| :--- | :--- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 元素 | 3    | 3    | 5    | 5    | 6    | 7    | 7    | 0    |



#### 动图演示

![计数排序](./images/countingSort.gif)

#### 代码实现

##### swift

`swift` 版本 `5`

基础版本

```swift
static func Sort(_ array: inout [Int]) {
    /// 找出元素的最大值
    var max = array[0]
    for item in array {
        if item > max {
            max = item
        }
    }

    /// 分配存储空间
    var countsArray: [Int] = [Int](repeating: 0, count: max + 1)

    /// 统计每个元素出现次数
    for i in 0 ..< array.count {
        let value = array[i]
        countsArray[value] += 1
    }

    /// 根据元素出现的次数，对数组进行排序
    var index = 0
    for element in 0 ..< countsArray.count {
        ///元素出现次数
        var counts = countsArray[element]
        while counts > 0 {
            array[index] = element
            index += 1
            counts -= 1
        }
    }
}
```



改进版本

```swift
func countingSort(_ array: [Int]) -> [Int] {
    let maxElement = array.max() ?? 0

    var countArray = [Int](repeating: 0, count: (maxElement + 1))
    for element in array {
        countArray[element] += 1
    }

    for index in 1..<countArray.count {
        let sum = countArray[index] + countArray[index - 1]
        countArray[index] = sum // array 中的元素 index， 在它之前有 sum 个元素
    }

    var sortedArray = [Int](repeating: 0, count: array.count)
    for element in array {
        countArray[element] -= 1
        let index = countArray[element] // 确定数组 array 中的元素 element， 应该放置的位置 
        sortedArray[index] = element
    }

    return sortedArray
}
```



##### Python

```python
def counting_sort(array):
    # find max value
    max = array[0]
    for element in array:
        if element > max:
            max = element
    
    # initialized the countsArray
    countsArray = []
    for _ in range(0, max + 1):
        countsArray.append(0)

    # calculate counts number and set value to countsArray
    for element in array:
        countsArray[element] += 1
    
    index = 0
    for i in range(0, len(countsArray)):
        value = countsArray[i]
        while value > 0:
            array[index] = i
            index += 1
            value -= 1
    return array
```



#### 性能

时间复杂度: O(n + k)

空间复杂度: O(2n)


#### 参考

- [swift-algorithm-club](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Counting%20Sort)
- [维基百科](https://zh.wikipedia.org/wiki/计数排序)
- [计数排序](https://github.com/hustcc/JS-Sorting-Algorithm/blob/master/8.countingSort.md)
