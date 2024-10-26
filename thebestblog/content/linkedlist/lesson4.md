+++
title = 'Find the intersection Node in the linked list'
date = 2024-10-26
+++


Here is the link to the problem: [Intersection node in the linked list](https://www.youtube.com/watch?v=ds35KU7a6nM&list=PLk6CEY9XxSICJ0XSI7fbQFiEpDHISJxqT&index=4).

## Problem Statement with Thought Process:

To find the intersection point between two linked lists in Python, we can use the approach you described:

1. Calculate the lengths of both lists.
2. Find the absolute difference in lengths and move the pointer of the longer list ahead by that difference.
3. Move both pointers forward one node at a time until they meet, which is the intersection point.


## Implementation
```python
class ListNode:
    def __init__(self, value=0, next=None):
        self.value = value
        self.next = next

def get_length(head):
    length = 0
    while head:
        length += 1
        head = head.next
    return length

def get_intersection_node(headA, headB):
    # Calculate the lengths of both linked lists
    lenA = get_length(headA)
    lenB = get_length(headB)

    # Find the difference in lengths
    diff = abs(lenA - lenB)

    # Advance the pointer for the longer list by 'diff' nodes
    if lenA > lenB:
        for _ in range(diff):
            headA = headA.next
    else:
        for _ in range(diff):
            headB = headB.next

    # Move both pointers forward until they meet at the intersection node
    while headA and headB:
        if headA == headB:
            return headA  # Intersection point
        headA = headA.next
        headB = headB.next

    return None  # No intersection

# Example usage
# Create linked lists with an intersection point for testing
# A: 1 -> 2 -> 3 \
#                  6 -> 7
# B:      4 -> 5 /

a = ListNode(1)
a.next = ListNode(2)
a.next.next = ListNode(3)
a.next.next.next = ListNode(6)
a.next.next.next.next = ListNode(7)

b = ListNode(4)
b.next = ListNode(5)
b.next.next = a.next.next.next  # Set intersection at node with value 6

intersection = get_intersection_node(a, b)
print("Intersection at node with value:", intersection.value if intersection else "No intersection")

```

## Complexity

Time Complexity: O(m+n) 

Space Complexity: O(1)
