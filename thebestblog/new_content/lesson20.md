+++
title = 'Remove Duplicates from Sorted List'
date = 2024-08-19
+++


Here is the link to the problem: [Remove duplicates (Linked List)](https://leetcode.com/problems/remove-duplicates-from-sorted-list/description/).

## Problem Statement:

Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

### Examples:

**Example 1**:

**Input**: head = [1,1,2]

**Output**: [1,2]

**Example 2**:

**Input**: head = [1,1,2,3,3]

**Output**: [1,2,3]

## My Solution

```python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def deleteDuplicates(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        cur = head
        while cur:
            while cur.next and cur.next.val == cur.val:
                cur.next = cur.next.next
            cur = cur.next
        return head
```

This is slightly different from the array one because here, it is linked list. Although we have two nested loop, but still it is O(n). While current pointer is not null, and there is next pointer and if the value of next pointer is same as the current pointer we update the next pointer to next next pointer. If the value is not same, we update the current pointer with the next pointer. Lastly, we return head pointer.
