# 单链表

单链表的特点：
- 无法 O(1) 索引，但是可以 O(1) 的时间复杂度来增加或者删除
- 无法查找上一个节点

解题技巧：
- 线性表，通过 `{ [index: number]: Node }` 来记录链表的位置，这样需要额外的 O(N) 的空间复杂度的开销。e.g. [LC.143.reorder-list](https://leetcode-cn.com/problems/reorder-list/description/)

- 快慢指针，可以利用快慢指针寻找链表的中间节点[LC.876](https://leetcode-cn.com/problems/middle-of-the-linked-list)，以及判断链表中有没有环。

- 哑节点 / dummy_head，可以利用在原链表之前插入一个哑节点来方便往列表的首端插入节点，也比较方便能够返回队首见 LC147。
