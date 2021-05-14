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
