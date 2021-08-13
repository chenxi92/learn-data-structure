### 回溯算法解题



基本解题思路

```python
result = []
def backtrack(路径, 选择列表):
    if 满足结束条件:
        result.add(路径)
        return
    
    for 选择 in 选择列表:
        做选择
        backtrack(路径, 选择列表)
        撤销选择
```



优化版本解题思路

```python
result = []
flags = [] 标记数组
def backtrack(路径, 选择列表):
    if 满足结束条件:
        result.add(路径)
        return
    
    for 选择 in 选择列表:
        判断是否已经做过标记
        
        做选择 + 标记
        backtrack(路径, 选择列表)
        撤销（选择 + 标记）
```



LeetCode 题目

[46. 全排列](../../leetcode/46-permutations.py) 

 [51.N皇后](../../leetcode/51-NQueens.py) 

