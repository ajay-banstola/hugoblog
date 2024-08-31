+++
title = 'Find if two linked list have intersection point'
date = 2024-08-31
+++


Here is the link to the problem: [Linked list intersection point](https://www.youtube.com/watch?v=zhMh2Nm1I5A&list=PLk6CEY9XxSICJ0XSI7fbQFiEpDHISJxqT&index=2).

## Problem Statement with Thought Process:

There are two ways to do this:

1. Using flag:

In this method, we set a flag to 0 in each node. 
After traversal to the node, the flag is changed to 1.   P1 comes doing this for first ll(linked list) and P2 comes doing this for second ll. If there is already a node with 1 as the flag, that means that is the intersection point.
But this will take more space to store the flag.

2. Traversing one list at a time:

In this method, we traverse one list at a time. Say we reached the destination d address 600 with the first linked list. If we then traverse second list and the reach the same destination d with address 600, then that means there is an intersection at some point. Note that we are only looking for the presence of the intersection and not the intersection point particularly.

Space complexity for this method is O(1) and time complexity is O(m+n).


