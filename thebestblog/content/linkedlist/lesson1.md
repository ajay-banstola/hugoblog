+++
title = 'Find the kth Node from the Back'
date = 2024-08-31
+++


Here is the link to the problem: [kth node from Back](https://www.youtube.com/watch?v=M5tQ4fJMsr0&list=PLk6CEY9XxSICJ0XSI7fbQFiEpDHISJxqT&index=1).

## Problem Statement with Thought Process:

We need to find the kth node from the back of the linked list. Imagine your four finger, where index finger is P1 and pinky finger is P2. To find 4th node from back, we place our hand at the end of the linked list, the index finger points to the 4th node from back. We took pinky finger kth steps from P1 and then moved P2 to the end of the list. Answer is pointed by P1. 


## Implementation

```python
def find_kth_from_end(head: ListNode, k: int) -> ListNode:
    # Initialize two pointers P1 and P2
    p1 = head
    p2 = head
    
    # Move P2 forward by k nodes
    for _ in range(k):
        if not p2:  # In case k is greater than the length of the list
            return None
        p2 = p2.next
    
    # Move both P1 and P2 until P2 reaches the end
    while p2:
        p1 = p1.next
        p2 = p2.next
    
    # P1 now points to the kth node from the end
    return p1
```
