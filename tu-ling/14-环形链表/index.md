#### 环形链表

给定一个链表，判断链表中是否有环。

如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达该节点，则链表中存在环。

如果链表中存在环，则返回 true，否则返回 false。



##### 解题思路

###### 借助集合

沿着 head 指针依次遍历链表， 每次遍历之前判断当前节点是否在集合中，如果在则存在环，否则把当前集合添加到链表中

时间复杂度：O(N)

空间复杂度：O(N)



###### 双指针

借助双指针来判断是否存在环，每次移动快指针都比慢指针走得快，如果快慢指针重合，则存在环，否则不存在。

时间复杂度：O(N)

空间复杂度：O(1)



##### 代码

```python
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

```

