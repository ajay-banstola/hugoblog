+++
title = 'Find if there is a cycle in linked list'
date = 2024-10-25
+++


Here is the link to the problem: [cycle in linked list](https://www.youtube.com/watch?v=9azsQcz6d9g&list=PLk6CEY9XxSICJ0XSI7fbQFiEpDHISJxqT&index=3)

## Problem Statement with Thought Process:

We need to find if there is a cycle in linked list

## Implementation

There are two pointers p1 and p2. P2 will jump by 1 node. P1 will just go serially. If there is a cycle, at one time, it is guaranteed that both of them will meet at some point.

This approach describes Floyd's Cycle Detection Algorithm, also known as the "Tortoise and Hare" algorithm. Here's an implementation in Python:

```python
class ListNode:
    def __init__(self, value=0, next=None):
        self.value = value
        self.next = next

def has_cycle(head):
    if not head or not head.next:
        return False
    
    slow = head  # p1 - moves one step at a time
    fast = head  # p2 - moves two steps at a time
    
    while fast and fast.next:
        slow = slow.next         # Move slow pointer by 1
        fast = fast.next.next    # Move fast pointer by 2

        if slow == fast:         # They meet, meaning a cycle exists
            return True
    
    return False  # No cycle detected

# Example usage
# Creating a cycle for demonstration: 1 -> 2 -> 3 -> 4 -> 2 (cycle back to 2)
node1 = ListNode(1)
node2 = ListNode(2)
node3 = ListNode(3)
node4 = ListNode(4)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2  # Cycle here

print(has_cycle(node1))  # Output: True

```
