# coding: utf-8


class ListNode(object):
    def __init__(self, value, next):
        super(ListNode, self).__init__()
        self.value = value
        self.next = next

    def __str__(self):
        if self.next is None:
            return "{}".format(self.value)
        else:
            return "{} -> {}".format(self.value, self.next)


def recursion(head):
    if head is None or head.next is None:
        return head
    newHead = recursion(head.next)
    # 2个节点之间反转: 1->2   2->1
    head.next.next = head
    head.next = None
    return newHead


node5 = ListNode(5, None)
node4 = ListNode(4, node5)
node3 = ListNode(3, node4)
ndoe2 = ListNode(2, node3)
head = ListNode(1, ndoe2)
print head
print recursion(head)
