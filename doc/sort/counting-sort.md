**计数排序（Counting sort）**是一种稳定的[线性时间](https://zh.wikipedia.org/wiki/線性時間)[排序算法](https://zh.wikipedia.org/wiki/排序算法)。该算法于1954年由 Harold H. Seward 提出。计数排序使用一个额外的数组![ C ](https://wikimedia.org/api/rest_v1/media/math/render/svg/4fc55753007cd3c18576f7933f6f089196732029)，其中第i个元素是待排序数组![A](https://wikimedia.org/api/rest_v1/media/math/render/svg/7daff47fa58cdfd29dc333def748ff5fa4c923e3)中值等于![i](https://wikimedia.org/api/rest_v1/media/math/render/svg/add78d8608ad86e54951b8c8bd6c8d8416533d20)的元素的个数。然后根据数组![ C ](https://wikimedia.org/api/rest_v1/media/math/render/svg/4fc55753007cd3c18576f7933f6f089196732029)来将![A](https://wikimedia.org/api/rest_v1/media/math/render/svg/7daff47fa58cdfd29dc333def748ff5fa4c923e3)中的元素排到正确的位置。



#### 算法简介

1. 找到待排序数组 A 的最大值 `maxElement`；
2. 创建一个新数组 B ，数组 B 的元素个数为 `maxElement` + 1;
3. 在数组 B 中确定数组 A 的每个元素之前应该放置的元素数量（根据步骤2的结果）;
4. 将数组 A 的每个元素 i 放在新数组的第 B[i] 项，每放一个元素就将 B[i] 减去`1` ；



#### 动图演示

![计数排序](./../../image/sort/countingSort.gif)

#### 代码实现

##### swift

`swift` 版本 `5.1`

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



#### 性能

时间复杂度: **O(n + k)**

空间复杂度:  **O(2n)**


#### 参考

- [swift-algorithm-club](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Counting%20Sort)
- [维基百科](https://zh.wikipedia.org/wiki/计数排序)
- [计数排序](https://github.com/hustcc/JS-Sorting-Algorithm/blob/master/8.countingSort.md)
