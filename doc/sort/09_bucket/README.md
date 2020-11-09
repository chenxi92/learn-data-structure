**桶排序（Bucket sort）**或所谓的**箱排序**，是一个[排序算法](https://zh.wikipedia.org/wiki/排序算法)，工作的原理是将[数组](https://zh.wikipedia.org/wiki/陣列)分到有限数量的桶里。每个桶再个别排序（有可能再使用别的[排序算法](https://zh.wikipedia.org/wiki/排序算法)或是以递归方式继续使用桶排序进行排序）。桶排序是[鸽巢排序](https://zh.wikipedia.org/wiki/鴿巢排序)的一种归纳结果。当要被排序的数组内的数值是均匀分配的时候，桶排序使用线性时间 O (n) 。但桶排序并不是[比较排序](https://zh.wikipedia.org/wiki/比较排序)，他不受到 O (n log n) 下限的影响。



### 算法步骤

桶排序以下列程序进行：

1. 设置一个定量的数组当作空桶子。
2. 寻访序列，并且把项目一个一个放到对应的桶子去。
3. 对每个不是空的桶子进行排序。
4. 从不是空的桶子里把项目再放回原来的序列中。



### 动图演示

元素分布在桶中:

![1](./images/bucket_sort_1.png)

然后元素在每个桶中排序:

![1](./images/bucket_sort_2.png)



### 代码实现

#### swift 

`swift` 版本 `5.1`

```swift
/// 桶排序
///
/// - Parameters:
///   - array: 待排序数组
///   - bucketSize: 每个桶内元素个数
func bucketSort(_ array: inout [Int], _ bucketSize: Int) {
    guard array.count > 1 else { return }

    let maxValue = array.max()!
    let minValue = array.min()!
		
  	// 确定桶的个数
    let bucketCount = (maxValue - minValue) / bucketSize + 1
    var buckets = Array(repeating: [Int](), count: bucketCount)
		
  	// 每个桶内填充内容
    for value in array {
        let index = (value - minValue) / bucketSize
        buckets[index].append(value)
    }
  
		// 清空原数组
    array.removeAll()
    for (_, value) in buckets.enumerated() {
      	// 每个小桶内的元素进行插入排序(升序)
        let result = insertionSort(value, <)
        for i in 0 ..< result.count {
          	// 重新插回原数组
            array.append(result[i])
        }
    }
}
```

每个小桶内的插入排序，参考 [插入排序](./insertion-sort.md)



### 性能

最坏时间复杂度: O (n ^ 2)

平均时间复杂度: O (n + k)

最坏空间复杂度: O (n * k)

### 参考

[维基百科](https://zh.wikipedia.org/wiki/桶排序)

[桶排序](https://www.runoob.com/w3cnote/bucket-sort.html)

