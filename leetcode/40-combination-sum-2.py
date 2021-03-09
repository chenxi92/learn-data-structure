# coding: utf-8

# https://leetcode.com/problems/combination-sum-ii/

# Given a collection of candidate numbers (candidates) and a target
# number (target), find all unique combinations in candidates
# where the candidate numbers sum to target.
# Each number in candidates may only be used once in the combination.
# Note: The solution set must not contain duplicate combinations.

# Constraints:
# 1 <= candidates.length <= 100
# 1 <= candidates[i] <= 50
# 1 <= target <= 30


class Solution(object):

    def combinationSum2(self, candidates, target):

        def backtrack(comb, remain, curr, counter, results):
            if remain == 0:
                results.append(list(comb))
                return
            elif remain < 0:
                return

            for nextCurr in range(curr, len(counter)):
                candidate, freq = counter[nextCurr]
                if freq <= 0:
                    continue

                # add a new element to the current combination
                comb.append(candidate)
                counter[nextCurr] = (candidate, freq - 1)

                backtrack(comb, remain - candidate, nextCurr, counter, results)

                # backtrack the changes, so that we can try anothor candidate
                counter[nextCurr] = (candidate, freq)
                comb.pop()

        results = []
        mapping = {}
        for c in candidates:
            if mapping.has_key(c):
                mapping[c] += 1
            else:
                mapping[c] = 1
        counter = []
        for k in mapping:
            counter.append((k, mapping[k]))
        backtrack([], target, 0, counter, results)
        return results


print Solution().combinationSum2([10, 1, 2, 7, 6, 1, 5], 8)
