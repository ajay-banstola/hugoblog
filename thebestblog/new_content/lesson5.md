+++
title = 'Find middle node in linked list'
date = 2024-10-26
+++


Here is the link to the problem: [Middle node in linked list](https://www.youtube.com/watch?v=PWTzaF0SMzs&list=PLk6CEY9XxSICJ0XSI7fbQFiEpDHISJxqT&index=5).

## Problem Statement with Thought Process:

There are three approaches to this probles:
1. Just traverse the whole list and divide by half?
2. We will discuss the second method
3. Third method is just like second method but here, we only increment count if the pointer is in odd node. Basically the same thing as jumping a node right?

The two-pointer approach to find the middle of a linked list works because one pointer moves at double the speed of the other. Here’s how and why it works:

Explanation of the Approach:

We use two pointers, often called the slow and fast pointers.
The slow pointer moves one node at a time, while the fast pointer moves two nodes at a time.
When the fast pointer reaches the end of the list, the slow pointer will be at the midpoint.
Why This Works:

Since the fast pointer covers two nodes for every one node that the slow pointer covers, by the time the fast pointer reaches the end of the list, the slow pointer will have traveled half as far, thus landing exactly at the middle.
If the linked list has an odd number of nodes, the slow pointer will stop at the middle node.
If the list has an even number of nodes, the slow pointer will stop at the first of the two middle nodes (depending on the implementation details).


## Implementation

```python
class ListNode:
    def __init__(self, value=0, next=None):
        self.value = value
        self.next = next

def find_middle(head):
    slow = head  # Pointer moving one step at a time
    fast = head  # Pointer moving two steps at a time

    while fast and fast.next:
        slow = slow.next  # Move slow pointer by 1 step
        fast = fast.next.next  # Move fast pointer by 2 steps

    # When fast reaches the end, slow is at the middle
    return slow

# Example usage
# Creating a linked list 1 -> 2 -> 3 -> 4 -> 5
head = ListNode(1)
head.next = ListNode(2)
head.next.next = ListNode(3)
head.next.next.next = ListNode(4)
head.next.next.next.next = ListNode(5)

middle_node = find_middle(head)
print("Middle node value:", middle_node.value)  # Expected output: 3
```

Complexity:

Time Complexity: 

O(n) because both pointers traverse the list only once.

Space Complexity: 

O(1) since only two pointers are used, regardless of the list size
