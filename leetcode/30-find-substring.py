# coding:utf-8

# https://leetcode.com/problems/substring-with-concatenation-of-all-words

# You are given a string s and an array of strings words of the same length.
# Return all starting indices of substring(s) in s that is a concatenation of
# each word in words exactly once, in any order,
# and without any intervening characters.
# You can return the answer in any order.

# Constraints:
# 1 <= s.length <= 104
# s consists of lower-case English letters.
# 1 <= words.length <= 5000
# 1 <= words[i].length <= 30
# words[i] consists of lower-case English letters.


class Solution(object):
    def findSubstring(self, s, words):
        """
        :type s: str
        :type words: List[str]
        :rtype: List[int]
        """
        from collections import Counter
        wordsCounter = Counter(words)

        counts = len(words)
        wordLen = len(words[0])
        n = len(s) - counts * wordLen + 1
        ans = []
        for i in range(n):
            seq = s[i: i + counts * wordLen]
            tempArray = []
            for j in range(0, counts * wordLen, wordLen):
                w = seq[j: j + wordLen]
                tempArray.append(w)
            if Counter(tempArray) == wordsCounter:
                ans.append(i)
        return ans


s = "barfoothefoobarman"
words = ["foo", "bar"]
print Solution().findSubstring(s, words)
