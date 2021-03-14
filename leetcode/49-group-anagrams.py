# coding: utf-8

# https://leetcode.com/problems/group-anagrams/
# Given an array of strings strs, group the anagrams together.
# You can return the answer in any order. An Anagram is a word
# or phrase formed by rearranging the letters of a different
# word or phrase, typically using all the original letters exactly once.


class Solution(object):
    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """
        mapping = {}
        for text in strs:
            key = "".join(sorted(text))
            if mapping.has_key(key):
                mapping[key].append(text)
            else:
                mapping[key] = [text]
        return mapping.values()


strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
print Solution().groupAnagrams(strs)
