# coding: utf-8

class Solution(object):
    def countAndSay(self, n):
        """
        :type n: int
        :rtype: str
        """
        return "".join(self.nextSequence(n, ['1', 'E']))

    # generate ∣count, digit∣
    def nextSequence(self, n, prevSeq):
        if n == 1:
            return prevSeq[: -1]
        nextSeq = []
        prevDigit = prevSeq[0]
        digitCnt = 1
        for digit in prevSeq[1:]:
            if digit == prevDigit:
                digitCnt += 1
            else:
                nextSeq.extend([str(digitCnt), prevDigit])
                prevDigit = digit
                digitCnt = 1
        nextSeq.append('E')
        return self.nextSequence(n - 1, nextSeq)


print Solution().countAndSay(6)
# for i in range(1, 6):
#     print Solution().countAndSay(i)
