# coding: utf-8

# https://leetcode.com/problems/delete-node-in-a-linked-list/

# Write a function to delete a node in a singly-linked list.
# You will not be given access to the head of the list,
# instead you will be given access to the node to be deleted directly.

# It is guaranteed that the node to be deleted is not a tail node in the list.

# Constraints:
# The number of the nodes in the given list is in the range [2, 1000].
# -1000 <= Node.val <= 1000
# The value of each node in the list is unique.
# The node to be deleted is in the list and is not a tail node


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
    def deleteNode(self, node):
        node.val = node.next.val
        node.next = node.next.next
