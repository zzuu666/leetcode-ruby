# 单链表

单链表的特点：
- 无法 O(1) 索引，但是可以 O(1) 的时间复杂度来增加或者删除
- 无法查找上一个节点

解题技巧：
- 线性表，通过 `{ [index: number]: Node }` 来记录链表的位置，这样需要额外的 O(N) 的空间复杂度的开销。e.g. [LC.143.reorder-list](https://leetcode-cn.com/problems/reorder-list/description/)
