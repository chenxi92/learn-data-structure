# coding: utf-8

# https://leetcode.com/problems/remove-duplicates-from-sorted-list/
# Given the head of a sorted linked list, delete all duplicates such that
# each element appears only once. Return the linked list sorted as well.

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
        cur = head
        while cur and cur.next:
            if cur.val == cur.next.val:
                cur.next = cur.next.next
            else:
                cur = cur.next
        return head


head = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3)))))
print head
print Solution().deleteDuplicates(head)
