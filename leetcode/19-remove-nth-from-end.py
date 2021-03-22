# coding: utf-8

# https://leetcode.com/problems/remove-nth-node-from-end-of-list/

# Given the head of a linked list, remove the nth node from the end of
# the list and return its head. Follow up: Could you do this in one pass?

# Constraints:
# The number of nodes in the list is sz.
# 1 <= sz <= 30
# 0 <= Node.val <= 100
# 1 <= n <= sz

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    def __str__(self):
        return "%s->%s" % (self.val, self.next)


class Solution(object):
    # Time complexity: O(l)
    # Space complexity: O(1)
    # reconnect (l - n) and (l - n + 1) node
    def removeNthFromEnd(self, head, n):
        dummy = ListNode(0)
        dummy.next = head
        length = 0
        first = head
        while first is not None:
            length += 1
            first = first.next
        length -= n
        first = dummy
        while length > 0:
            length -= 1
            first = first.next
        first.next = first.next.next
        return dummy.next

    def removeNthFromEnd1(self, head, n):
        dummy = ListNode(0)
        dummy.next = head
        first = dummy
        second = dummy
        for _ in range(n + 1):
            first = first.next

        while first is not None:
            first = first.next
            second = second.next
        second.next = second.next.next
        return dummy.next


head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
print Solution().removeNthFromEnd1(head, 2)
