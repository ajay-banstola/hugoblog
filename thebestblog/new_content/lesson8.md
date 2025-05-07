+++
title = 'Remove duplicates from sorted linked list'
date = 2024-10-28
+++


Here is the link to the problem: [Remove duplicates from sorted linked list](https://www.youtube.com/watch?v=QLlxh96WfYU&list=PLk6CEY9XxSICJ0XSI7fbQFiEpDHISJxqT&index=8)

## Problem Statement with Thought Process:

Here's a Python function to remove duplicates from a sorted linked list:

```python
class ListNode:
    def __init__(self, value=0, next=None):
        self.value = value
        self.next = next

def remove_duplicates(head: ListNode) -> ListNode:
    current = head
    while current and current.next:
        if current.value == current.next.value:
            current.next = current.next.next  # Skip the duplicate node
        else:
            current = current.next  # Move to the next unique node
    return head
```

### Explanation
- The function takes the head of a sorted linked list as input.
- It iterates through the list, checking if the current node has the same value as the next node.
- If they are the same, it skips the next node by pointing `current.next` to `current.next.next`.
- If they differ, it simply moves to the next node.
  
### Example Usage

```python
# Helper function to print the list
def print_list(head: ListNode):
    current = head
    while current:
        print(current.value, end=" -> ")
        current = current.next
    print("None")

# Create a sorted linked list with duplicates
head = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3)))))
print("Original list:")
print_list(head)

# Remove duplicates
head = remove_duplicates(head)
print("List after removing duplicates:")
print_list(head)
```

### Output
```
Original list:

1 -> 1 -> 2 -> 3 -> 3 -> None

List after removing duplicates:

1 -> 2 -> 3 -> None
```

This function efficiently removes duplicates from a sorted linked list in O(n) time, where \( n \) is the number of nodes in the list.
