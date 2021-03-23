# coding: utf-8

# https://leetcode.com/problems/merge-k-sorted-lists/

# You are given an array of k linked-lists lists, each linked-list is sorted
# in ascending order.
# Merge all the linked-lists into one sorted linked-list and return it.

# Constraints:
# k == lists.length
# 0 <= k <= 10^4
# 0 <= lists[i].length <= 500
# -10^4 <= lists[i][j] <= 10^4
# lists[i] is sorted in ascending order.
# The sum of lists[i].length won't exceed 10^4

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
    def mergeKLists(self, lists):
        """
        :type lists: List[ListNode]
        :rtype: ListNode
        """
        ans = None
        for node in lists:
            ans = self.merge(ans, node)
        return ans

    def merge(self, head, tail):
        sentinel = ListNode(0)
        cur = sentinel
        while head and tail:
            if head.val < tail.val:
                cur.next = head
                head = head.next
            else:
                cur.next = tail
                tail = tail.next
            cur = cur.next
        if head:
            cur.next = head
        if tail:
            cur.next = tail
        return sentinel.next


l1 = ListNode(1, ListNode(4, ListNode(5)))
l2 = ListNode(1, ListNode(3, ListNode(4)))
l3 = ListNode(2, ListNode(6))
lists = [l1, l2, l3]
print "--- begin merge ---"
for node in lists:
    print node
print "--- after merge ---"
print "1 ", Solution().mergeKLists([l1, l2, l3])
