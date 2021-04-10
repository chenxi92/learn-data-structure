# coding: utf-8

# https://leetcode.com/problems/path-sum-ii/
# Given the root of a binary tree and an integer targetSum,
# return all root-to-leaf paths where each path's sum equals targetSum.
# A leaf is a node with no children.
# Constraints:
# The number of nodes in the tree is in the range [0, 5000].
# -1000 <= Node.val <= 1000
# -1000 <= targetSum <= 1000

# Definition for a binary tree node.


class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution(object):
    def pathSum(self, root, targetSum):
        """
        :type root: TreeNode
        :type targetSum: int
        :rtype: List[List[int]]
        """
        ans = []
        self.dfs(root, [], targetSum, ans)
        return ans

    def dfs(self, root, path, targetSum, ans):
        if root is None:
            return
        if root.left is None and root.right is None and targetSum == root.val:
            path.append(root.val)
            ans.append(path)
            return
        self.dfs(root.left, path + [root.val], targetSum - root.val, ans)
        self.dfs(root.right, path + [root.val], targetSum - root.val, ans)


root = TreeNode(1, TreeNode(2), TreeNode(3))
print Solution().pathSum(root, 5)
