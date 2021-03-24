# coding: utf-8

# https://leetcode.com/problems/reverse-nodes-in-k-group/

# Given a linked list, reverse the nodes of a linked list k at a time
# and return its modified list. k is a positive integer and is less than or
# equal to the length of the linked list. If the number of nodes is not a
# multiple of k then left-out nodes, in the end, should remain as it is.

# Follow up:
# Could you solve the problem in O(1) extra memory space?
# You may not alter the values in the list's nodes,
# only nodes itself may be changed.

# Constraints:
# The number of nodes in the list is in the range sz.
# 1 <= sz <= 5000
# 0 <= Node.val <= 1000
# 1 <= k <= sz


# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    def __str__(self):
        if self.next:
            return "{}->{}".format(self.val, self.next)
        else:
            return "{}".format(self.val)


class Solution(object):
    def reverseKGroup(self, head, k):
        """
        :type head: ListNode
        :type k: int
        :rtype: ListNode
        """
        sentinel = ListNode(0)
        sentinel.next = head
        prev = sentinel
        while prev:
            tail = prev
            for i in range(k):
                tail = tail.next
                if tail is None:
                    return sentinel.next

            next = tail.next
            head, tail = self.reverse(head, tail)
            # reconnect
            prev.next = head
            tail.next = next
            prev = tail
            head = tail.next
        return sentinel.next

    def reverse(self, head, tail):
        """
        1->2->3
        1<-2<-3
        """
        prev = tail.next
        cur = head
        while prev != tail:
            next = cur.next
            cur.next = prev
            prev = cur
            cur = next
        return tail, head


head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
print head
# tail = head.next.next.next.next
# print "head = ", head
# print "tail = ", tail
# end, start = Solution().reverse(head, tail)
# print "start =", start
# print "end = ", end
print Solution().reverseKGroup(head, 2)
