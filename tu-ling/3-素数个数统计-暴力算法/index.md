#### 素数个数统计

统计n以内的素数个数

> 素数：只能被1和自身整除的自然数， 0、1除外



##### 解题思路

1. 使用暴力算法依次遍历每一个从 2 到 n的整数

2. 对遍历的整数x判断是否是素数
   1. 从 2 到 $\sqrt{x}$ 开始遍历，判断是否是整数



##### 代码

 ```python
 # coding: utf-8
 
 
 def fb(n):
     count = 0
     for i in range(2, n):
         if isPrime1(i):
             count += 1
     return count
 
 
 def isPrime1(x):
     i = 2
     while i * i <= x:
         if x % i == 0:
             return False
         i += 1
     return True
 
 
 print fb(100)
 
 ```

