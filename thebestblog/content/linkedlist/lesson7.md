+++
title = 'Reverse a linked list (Recursive way)'
date = 2024-10-26
+++


Here is the link to the problem: [Reverse a linked list (Recursive way)](https://www.youtube.com/watch?v=ps2Z9n5H03Y&list=PLk6CEY9XxSICJ0XSI7fbQFiEpDHISJxqT&index=7)

## Problem Statement with Thought Process:

To reverse a linked list recursively, we can use the following approach:

1. **Base Case**: If we reach the end of the list (i.e., `head` is `None`) or there is only one node left, we return `head` as it will be the new head of the reversed list.
2. **Recursive Step**:
   - Recursively reverse the rest of the list.
   - Set the next node’s next pointer to the current node (reversing the link).
   - Set the current node’s next pointer to `None` to prevent cycles.

Here’s the Python code for reversing a linked list recursively:

```python
class ListNode:
    def __init__(self, value=0, next=None):
        self.value = value
        self.next = next

def reverse_linked_list_recursive(head):
    # Base case: if head is None or only one node, return head
    if head is None or head.next is None:
        return head

    # Reverse the rest of the list
    new_head = reverse_linked_list_recursive(head.next)

    # Make the next node point back to the current node
    head.next.next = head
    head.next = None  # Set the current node's next pointer to None

    return new_head  # Return the new head of the reversed list

# Example usage
# Creating a linked list 1 -> 2 -> 3 -> 4 -> 5
head = ListNode(1)
head.next = ListNode(2)
head.next.next = ListNode(3)
head.next.next.next = ListNode(4)
head.next.next.next.next = ListNode(5)

reversed_head = reverse_linked_list_recursive(head)

# Print reversed list
current = reversed_head
while current:
    print(current.value, end=" -> " if current.next else "")
    current = current.next
```

### Explanation
- Each recursive call reverses the list starting from the current node's next node onward.
- After reversing, the function makes `head.next.next` point back to `head`, effectively reversing the link.
- The `head.next` is set to `None` to avoid a cycle.
- The recursion unwinds, and `new_head` will eventually hold the new head of the reversed list.

### Complexity Analysis
- **Time Complexity**: \(O(n)\), where \(n\) is the number of nodes, as each node is visited once.
- **Space Complexity**: \(O(n)\), due to the recursive stack space.

```
