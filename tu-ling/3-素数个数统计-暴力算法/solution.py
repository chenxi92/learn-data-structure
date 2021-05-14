# coding: utf-8


def fb(n):
    count = 0
    for i in range(2, n):
        if isPrime1(i):
            count += 1
    return count


def isPrime(x):
    for i in range(2, x):
        if x % i == 0:
            return False
    return True


def isPrime1(x):
    i = 2
    while i * i <= x:
        if x % i == 0:
            return False
        i += 1
    return True


print fb(100)
