# coding: utf-8

# https://leetcode.com/problems/reverse-linked-list-ii/
# Given the head of a singly linked list and two integers left and right
# where left <= right, reverse the nodes of the list from position left to
# position right, and return the reversed list.

# Constraints:
# The number of nodes in the list is n.
# 1 <= n <= 500
# -500 <= Node.val <= 500
# 1 <= left <= right <= n


# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    def __str__(self):
        if self.next is not None:
            return "{} -> {}".format(self.val, self.next)
        else:
            return "{}".format(self.val)


class Solution(object):

    def __init__(self, left=None, stop=False):
        self.left = left
        self.stop = stop

    def recursiveAndReverse(self, right, m, n):
        if n == 1:
            return
        right = right.next
        if m > 1:
            self.left = self.left.next
        # print "before {} <--> {}".format(m, n)
        self.recursiveAndReverse(right, m - 1, n - 1)
        # print "\nafter {} <--> {}".format(m, n)
        # print self.left.val, right.val
        if self.left == right or right.next == self.left:
            self.stop = True
        if self.stop is False:
            # print "swap {} <--> {}".format(self.left.val, right.val)
            temp = self.left.val
            self.left.val = right.val
            right.val = temp
            self.left = self.left.next
            # print "after swap {} <--> {}".format(self.left.val, right.val)

    def reverseBetween(self, head, left, right):
        """
        :type head: ListNode
        :type left: int
        :type right: int
        :rtype: ListNode
        """
        self.left = head
        self.stop = False
        self.recursiveAndReverse(self.left, left, right)
        return head


head = ListNode(7, ListNode(9, ListNode(
    2, ListNode(10, ListNode(1, ListNode(8, ListNode(6)))))))
print head
print Solution().reverseBetween(head, 3, 5)
