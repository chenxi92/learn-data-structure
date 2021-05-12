#### 链表反转-迭代

> 将单链表的链接顺序反转过来



##### 解题思路

```
输入：1->2->3->4->5
输出：5->4->3->2->1
```

顺序遍历链表，执行如下操作：

1. 将下一个节点保存到 next 变量中；

2. 处理 prev 变量，将下一个节点的指针指向 prev；

3. 处理 cur 变量，准备处理下一个变量，将 curr 赋值给 prev；

4. 处理 next 变量，将下一个节点赋值为 curr， 准备处理下一个节点；



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

```

