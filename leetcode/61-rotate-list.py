# coding: utf-8

# https://leetcode.com/problems/rotate-list/
# Given the head of a linked list, rotate the list to the right by k places.

# Constraints:
# The number of nodes in the list is in the range [0, 500].
# -100 <= Node.val <= 100
# 0 <= k <= 2 * 109


# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    def __str__(self):
        if self.next is None:
            return "%s" % self.val
        else:
            return "%s -> %s" % (self.val, self.next)


class Solution(object):
    def rotateRight(self, head, k):
        """
        :type head: ListNode
        :type k: int
        :rtype: ListNode
        """
        if head is None:
            return head
        length = 1
        tail = head
        newHead = tail
        while tail.next is not None:
            tail = tail.next
            length += 1
        if k % length == 0:
            return head

        tail.next = head
        k = length - (k % length)
        for i in range(k):
            tail = tail.next
        newHead = tail.next
        tail.next = None
        return newHead


head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
print head
print Solution().rotateRight(head, 5)
