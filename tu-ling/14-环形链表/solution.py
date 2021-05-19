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


def hasCycle(head):
    nodes = set()
    while head is not None:
        if head in nodes:
            return True
        nodes.add(head)
        head = head.next
    return False


def hasCycle2(head):
    if head is None or head.next is None:
        return False
    low = head
    quick = head.next
    while low != quick:
        if quick is None or quick.next is None:
            return False
        low = low.next
        quick = quick.next.next
    return True


node5 = ListNode(5, None)
node4 = ListNode(4, node5)
node3 = ListNode(3, node4)
ndoe2 = ListNode(2, node3)
head = ListNode(1, ndoe2)
node5.next = node3
print hasCycle(head)
print hasCycle2(head)
