#### 链表反转-递归

> 将单链表的链接顺序反转过来



##### 解题思路

```
输入：1->2->3->4->5
反转4-5：1 -> 2 -> 3 -> 4 <- 5
反转3-4：1 -> 2 -> 3 <- 4 <- 5
反转2-3：1 -> 2 <- 3 <- 4 <- 5
反转1-2：1 <- 2 <- 3 <- 4 <- 5
```

4. 以相似的方法重复，类似树形结构，先从根节点找到叶子节点，从叶子节点开始遍历；
2. 大的问题（整个链表反转）拆成性质相同的小问题（2个元素反转）；
3. 所有的小问题解决，则大问题解决；
4. 从最后一个元素开始往前反转来保证整个链不断;



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
```

