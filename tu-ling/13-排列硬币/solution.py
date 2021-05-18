# coding: utf-8


def arrageCoins(n):
    for i in range(1, n + 1):
        n -= i
        if n <= i:
            return i
    return 0


def arrageCoinsSearch(n):
    low = 0
    high = n
    while low <= high:
        mid = low + (high - low) / 2
        cost = mid * (mid + 1) / 2
        if cost == n:
            return n
        elif cost > n:
            high = mid - 1
        else:
            low = mid + 1
    return high


def arrageCoinsNeuton(n):
    if n == 0:
        return n
    return _sqrt(n, n)


def _sqrt(x, n):
    res = (x + (2 * n - x) / x) / 2
    if res == x:
        return x
    else:
        return _sqrt(res, n)


n = 12
print arrageCoins(n)
print arrageCoinsSearch(n)
print arrageCoinsNeuton(n)
