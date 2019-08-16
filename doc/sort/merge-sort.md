
### 算法简介

Merge Sort 由 [John von Neumann](https://en.wikipedia.org/wiki/John_von_Neumann) 在 1945 年发明的，主要采用 '分而治之' 的方法来排序。 主要有两种实现方式:

- 自顶向下的递归

- 自底向上的迭代

#### 自顶向下的实现方式

##### 算法步骤

1. 把一个无序数组分割成 2 个子数组；
2. 每个子数组重复步骤1，直到子数组都分割成只有 1 个元素的数组（认为该数组有序）；
3. 将 2 个包含 1 个元素的有序数组，合并成 1 个包含 2 个元素的大数组；
4. 将 2 个包含 2 个元素的有序数组，合并成 1 个包含 4 个元素的大数组；
5. 依次类推可以把所有的元素合并成一个新的有序数组；

##### 动图演示

![自顶向下](./../../image/sort/merge-sort-top-down.gif)

##### 代码实现

###### swift

swift 版本 5.1

```swift
/// 自顶向下实现
func mergeSortTopDown<T: Comparable>(_ array: [T]) -> [T] {
    // 1 退出递归条件
    guard array.count > 1 else { return array }

    let middleIndex = array.count / 2
    let leftArray = mergeSortTopDown(Array(array[0..<middleIndex]))
    let rightArray = mergeSortTopDown(Array(array[middleIndex..<array.count]))

    return merge(leftPile: leftArray, rightPile: rightArray)
}
    
func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
    // both leftPile and rightPile are sorted.
    
    // 提前分配内存
    var orderdPile = [T]()
    orderdPile.reserveCapacity(leftPile.count + rightPile.count)
    
    // 分别追踪左右数组排序的位置
    var leftIndex = 0
    var rightIndex = 0

    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderdPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderdPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderdPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderdPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }


    while leftIndex < leftPile.count {
        orderdPile.append(leftPile[leftIndex])
        leftIndex += 1
    }

    while rightIndex < rightPile.count {
        orderdPile.append(rightPile[rightIndex])
        rightIndex += 1
    }

    return orderdPile
}
```


##### 性能

平均时间复杂度: O(n log n)

空间复杂度： O(n)



#### 自底向上的实现方式

##### 算法步骤

1. 每 2 个相邻的 1 个元素进行排序(此时每 2 个元素是有序的)；
2. 每 2 个相邻的 2 个元素进行排序(此时每 4 个元素是有序的)；
3. 每 2 个相邻的 4 个元素进行排序(此时每 8 个元素是有序的)；
4. 依次类推直到所有的元素都排序完成；


##### 动图演示

##### ![自底向上](./../../image/sort/merge-sort-bottom-up.png)


##### 代码实现

##### swift

swift 版本 `5.1`

```swift
/// 自底向上实现
func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    let n = a.count

    var z = [a, a]      // 1
    var d = 0

    var width = 1
    while width < n {   // 2

        var i = 0
        while i < n {     // 3

            var j = i
            var l = i
            var r = i + width

            let lmax = min(l + width, n)
            let rmax = min(r + width, n)

            while l < lmax && r < rmax {                
                if isOrderedBefore(z[d][l], z[d][r]) {
                    z[1 - d][j] = z[d][l]
                    l += 1
                } else {
                    z[1 - d][j] = z[d][r]
                    r += 1
                }
                j += 1
            }
            while l < lmax {
                z[1 - d][j] = z[d][l]
                j += 1
                l += 1
            }
            while r < rmax {
                z[1 - d][j] = z[d][r]
                j += 1
                r += 1
            }

            i += width*2
        }

        width *= 2
        d = 1 - d      // 4
    }
    return z[d]
}
```

1. 双缓存: 分配一个临时的工作数组，同时避免每次合并的时候重新分配内存。使用两个数组，一个用来读，一个用来写，使用 `d` 来控制读写数组。 
2. 首先合并相邻的每 1 个元素；之后合并相邻的每 2 个元素；之后合并相邻的每 4 个元素 ... 以此类推。使用 `width` 来控制每次合并几个元素, 初始值为 1 。
3. 内部的 while 循环把每一对小的有序数组合并一个较大的有序数组， 从 `z[d]` 内读取数据， 写入到 `z[1-d]` 中。
4. 调整需要合并的元素的个数， 调换数组读写顺序。

#### 参考链接

- [十大经典排序算法](https://github.com/hustcc/JS-Sorting-Algorithm)
- [归并排序](https://www.cnblogs.com/nullzx/p/5968170.html)
- [swift-algorithm-club](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Merge%20Sort)
- [维基百科](https://en.wikipedia.org/wiki/Merge_sort) 
