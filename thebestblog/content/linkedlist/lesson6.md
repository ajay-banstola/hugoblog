+++
title = 'Reverse a linked list (Iterative way)'
date = 2024-10-26
+++


Here is the link to the problem: [Reverse a linked list (Iterative way)](https://www.youtube.com/watch?v=eB1G2QtcOyM&list=PLk6CEY9XxSICJ0XSI7fbQFiEpDHISJxqT&index=6).

## Problem Statement with Thought Process:

To reverse a linked list iteratively, we can use three pointers:

1. **Previous Pointer**: Keeps track of the previous node, which will help us reverse the links.
2. **Current Pointer**: Points to the current node we’re processing.
3. **Next Pointer**: Temporarily stores the next node before we change the `current` node's link.

Here’s the iterative process:
- Start with `previous` as `None` and `current` as the head of the list.
- Iterate through the list, and for each node:
  - Save the `next` node.
  - Reverse the link by making the `current` node point to the `previous` node.
  - Move `previous` and `current` one step forward.
- When `current` becomes `None`, `previous` will be the new head of the reversed list.

### Python Code for Iteratively Reversing a Linked List

```python
class ListNode:
    def __init__(self, value=0, next=None):
        self.value = value
        self.next = next

def reverse_linked_list(head):
    previous = None
    current = head

    while current:
        next_node = current.next  # Save the next node
        current.next = previous  # Reverse the link
        previous = current  # Move previous one step forward
        current = next_node  # Move current one step forward

    return previous  # New head of the reversed list

# Example usage
# Creating a linked list 1 -> 2 -> 3 -> 4 -> 5
head = ListNode(1)
head.next = ListNode(2)
head.next.next = ListNode(3)
head.next.next.next = ListNode(4)
head.next.next.next.next = ListNode(5)

reversed_head = reverse_linked_list(head)

# Print reversed list
current = reversed_head
while current:
    print(current.value, end=" -> " if current.next else "")
    current = current.next
```

### Explanation of the Code
- **Previous and Current**: `previous` and `current` pointers help us reverse the links one node at a time.
- **Loop**: Each iteration updates the `next` pointer of the `current` node to point backward (to `previous`), and then all pointers are moved one step forward.
- **Return**: When `current` becomes `None`, `previous` points to the new head of the reversed list.

### Complexity Analysis
- **Time Complexity**: \(O(n)\), since each node is visited once.
- **Space Complexity**: \(O(1)\), as only a constant amount of extra space is used.


![Image for reversing a linked list](/images/reverse_linked_list)
