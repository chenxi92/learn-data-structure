# coding: utf-8

# https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/

# Given the head of a sorted linked list, delete all nodes that have duplicate
# numbers, leaving only distinct numbers from the original list.
# Return the linked list sorted as well.

# Constraints:
# The number of nodes in the list is in the range [0, 300].
# -100 <= Node.val <= 100
# The list is guaranteed to be sorted in ascending order.


class ListNode(object):
    def __init__(self, val=0, next=None):
        super(ListNode, self).__init__()
        self.val = val
        self.next = next

    def __str__(self):
        if self.next:
            return "%s->%s" % (self.val, self.next)
        else:
            return "%s" % self.val


class Solution(object):
    def deleteDuplicates(self, head):
        sentinel = ListNode(0)
        sentinel.next = head
        pre = sentinel
        cur = head
        while cur:
            diffNode = cur
            diffNum = 0
            while diffNode and diffNode.val == cur.val:
                diffNum += 1
                diffNode = diffNode.next
            if diffNum > 1:
                pre.next = diffNode
            else:
                pre = cur
            cur = diffNode
        return sentinel.next

    def deleteDuplicates1(self, head):
        sentinel = ListNode(0)
        sentinel.next = head
        pre = sentinel
        if head.next and head.val == head.next.val:
            while head.next and head.val == head.next.val:
                head = head.next
            pre.next = head.next
        else:
            pre = pre.next
        head = head.next
        return sentinel.next


head = ListNode(1, ListNode(2, ListNode(2, ListNode(2, ListNode(3)))))
print head
print Solution().deleteDuplicates(head)
