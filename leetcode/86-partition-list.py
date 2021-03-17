# coding: utf-8

# https://leetcode.com/problems/partition-list/

# Given the head of a linked list and a value x, partition it such that all
# nodes less than x come before nodes greater than or equal to x.
# You should preserve the original relative order of the nodes
# in each of the two partitions.

# Constraints:
# The number of nodes in the list is in the range [0, 200].
# -100 <= Node.val <= 100
# -200 <= x <= 200

# Definition for singly-linked list.


class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    def __str__(self):
        if self.next is not None:
            return "%s -> %s" % (self.val, self.next)
        else:
            return "%s" % (self.val)


class Solution(object):
    def partition(self, head, x):
        """
        :type head: ListNode
        :type x: int
        :rtype: ListNode
        """
        small = ListNode(0)
        smallHead = small
        large = ListNode(0)
        largeHead = large
        cur = head
        while cur:
            if cur.val < x:
                small.next = cur
                small = small.next
            else:
                large.next = cur
                large = large.next
            cur = cur.next
        small.next = largeHead.next
        large.next = None
        return smallHead.next


head = ListNode(1, ListNode(4, ListNode(
    3, ListNode(2, ListNode(5, ListNode(2))))))
print head
print Solution().partition(head, 3)
