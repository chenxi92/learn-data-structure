# coding: utf-8

# https://leetcode.com/problems/swap-nodes-in-pairs/
# Given a linked list, swap every two adjacent nodes and return its head.


class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    def __str__(self):
        return "%s->%s" % (self.val, self.next)


class Solution(object):
    # swap: pre -> a -> b -> b.next
    # to  : pre -> b -> a -> b.next
    def swapPairs(self, head):
        pre, pre.next = self, head
        while pre.next and pre.next.next:
            a = pre.next
            b = a.next
            pre.next, b.next, a.next = b, a, b.next
            pre = a
        return self.next

    def swapPairs1(self, head):
        if not head or not head.next:
            return head
        next = head.next
        (head.val, next.val) = (next.val, head.val)
        self.swapPairs1(next.next)
        return head


head = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
print head
print Solution().swapPairs(head)

head1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
print head1
print Solution().swapPairs1(head1)
