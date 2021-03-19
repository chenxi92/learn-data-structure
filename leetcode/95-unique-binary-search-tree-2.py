# coding: utf-8

# Given an integer n, return all the structurally unique BST's (binary search
# trees), which has exactly n nodes of unique values from 1 to n.
# Return the answer in any order.

# Constraints:
# 1 <= n <= 8

# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

    def __str__(self):
        if self.left and self.right:
            return "{}<-{}->{}".format(self.left, self.val, self.right)
        if self.left:
            return "{}<-{}".format(self.left, self.val)
        if self.right:
            return "{}->{}".format(self.val, self.right)
        return "{}".format(self.val)


class Solution(object):
    def generateTrees(self, n):
        """
        :type n: int
        :rtype: List[TreeNode]
        """
        return self.genTrees(1, n)

    def genTrees(self, start, end):
        results = []
        if start > end:
            results.append(None)
            return results

        if start == end:
            results.append(TreeNode(start))
            return results

        leftSubTrees = []
        rightSubTrees = []
        for i in range(start, end + 1):
            leftSubTrees = self.genTrees(start, i - 1)
            rightSubTrees = self.genTrees(i + 1, end)
            # print "leftSubTrees = ", leftSubTrees
            # print "rightSubTrees = ", rightSubTrees
            for lNode in leftSubTrees:
                # print "lNode = ", lNode
                for rNode in rightSubTrees:
                    # print "rNode = ", rNode
                    root = TreeNode(i)
                    root.left = lNode
                    root.right = rNode
                    results.append(root)
        return results


# head = TreeNode(3, TreeNode(2), TreeNode(4))
# print head
for x in Solution().generateTrees(3):
    print x
