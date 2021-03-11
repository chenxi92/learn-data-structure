# coding: utf-8

# Given a string s, find the length of the longest substring without repeating characters.
# https://leetcode.com/problems/longest-substring-without-repeating-characters/
# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.

# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

class Solution(object):

    def lengthOfLongestSubstring(self, s):
        if s is None:
            return 0
        if len(s) <= 1:
            return 0
        occured = set()
        result = pointer = 0
        for i in range(len(s)):
            if i != 0:
                occured.remove(s[i - 1])
            while pointer < len(s) and s[pointer] not in occured:
                occured.add(s[pointer])
                # print s[pointer], occured
                pointer += 1
            result = max(result, pointer - i)
        print occured
        return result


print Solution().lengthOfLongestSubstring("abcabcbb")
print Solution().lengthOfLongestSubstring("pwwkew")
