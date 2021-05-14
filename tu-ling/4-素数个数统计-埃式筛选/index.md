#### 素数个数统计-埃式筛选

统计n以内的素数个数

> 素数：只能被1和自身整除的自然数， 0、1除外



##### 解题思路

合数（非素数）: 4,  6, 8, 。。。

每遍历到一个素数（第一个素数是2），根据该素数找到可能的合数，设置标记位；

下次遍历时跳过合数;



##### 代码

 ```python
 # coding: utf-8
 
 
 def eratosthenes(n):
     # false 素数, 默认是素数
     isPrime = [False] * n
     count = 0
     for i in range(2, n):
         if isPrime[i] is False:
             count += 1
             # j 是合数的标记位
             j = 2 * i
             while j < n:
                 isPrime[j] = True
                 j += i
     return count
 
 
 print eratosthenes(100)
 
 ```

