+++
title = 'Climbing Stairs'
date = 2024-07-22
+++


Here is the link to the problem: [Climbing Stairs](https://leetcode.com/problems/climbing-stairs/description/).

## Problem Statement:

You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

### Examples:

**Example 1**:

**Input**: n = 2

**Output**: 2


**Explanation**: There are two ways to climb to the top.

1. 1 step + 1 step

2. 2 steps

**Example 2**:

**Input**: n = 3

**Output**: 3

**Explanation**: There are three ways to climb to the top.

1. 1 step + 1 step + 1 step

2. 1 step + 2 steps

3. 2 steps + 1 step


## My Solution

```python
class Solution(object):
    def climbStairs(self, n):
        """
        :type n: int
        :rtype: int
        """
        a = 0
        b = 1
        sum = 0
        list_value = []
        for i in range(n):
            sum = a + b
            a = b 
            b = sum
            list_value.append(b)

        return list_value[n-1]

```

This looks complicated but is actually a fibonacci problem. There is an excellent explanation by coding dojo. I will link it here for your reference.

**Youtubelink** : https://www.youtube.com/watch?v=5o-kdjv7FD0

