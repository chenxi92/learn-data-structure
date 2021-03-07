# coding: utf-8

# https://leetcode.com/problems/remove-linked-list-elements/
# Remove all elements from a linked list of integers that have value val.


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
    def removeElement(self, head, val):
        sentinel = ListNode(0)
        sentinel.next = head
        pre, cur = sentinel, head
        while cur:
            if cur.val == val:
                pre.next = cur.next
            else:
                pre = cur
            cur = cur.next
        return sentinel.next


head = ListNode(1, ListNode(2, ListNode(
    6, ListNode(3, ListNode(4, ListNode(5, ListNode(6)))))))

print head
print Solution().removeElement(head, 6)
