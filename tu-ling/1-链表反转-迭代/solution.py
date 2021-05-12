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


def iterate(head):
    prev = None
    next = None
    cur = head
    while cur is not None:
        # 保存下一个指针
        next = cur.next
        cur.next = prev
        prev = cur
        cur = next
    return prev


node5 = ListNode(5, None)
node4 = ListNode(4, node5)
node3 = ListNode(3, node4)
ndoe2 = ListNode(2, node3)
head = ListNode(1, ndoe2)
print head
print iterate(head)
