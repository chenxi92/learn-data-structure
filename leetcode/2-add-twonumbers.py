# coding: utf-8

# https://leetcode.com/problems/add-two-numbers/
# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.

class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution(object):
    def addTwoNumber(self, l1, l2):
        carry = 0
        root = current = ListNode(0)
        while l1 or l2 or carry:
            v1 = v2 = 0
            if l1:
                v1 = l1.val
                l1 = l1.next
            if l2:
                v2 = l2.val
                l2 = l2.next
            carry, val = divmod(v1 + v2 + carry, 10)
            current.next = ListNode(val)
            current = current.next
        return root.next


def printNode(node):
    result = str(node.val)
    next = node.next
    while next:
        result += " -> "
        result += str(next.val)
        next = next.next
    print result


l1 = ListNode(2, ListNode(4, ListNode(3)))
l2 = ListNode(5, ListNode(6, ListNode(4)))
printNode(Solution().addTwoNumber(l1, l2))
