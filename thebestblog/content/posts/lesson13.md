+++
title = 'Square root'
date = 2024-07-22
+++


Here is the link to the problem: [Square root](https://leetcode.com/problems/sqrtx/description/).

## Problem Statement:

Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.

You must not use any built-in exponent function or operator.

For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.


### Examples:

**Example 1**:

**Input**: x = 4

**Output**: 2

**Explanation**: The square root of 4 is 2, so we return 2.


**Example 2**:

**Input**: x = 8

**Output**: 2

**Explanation**: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.


## My Solution

```python
class Solution(object):
    def mySqrt(self, x):
        """
        :type x: int
        :rtype: int
        """
        m = x//2
        l = 1
        r = x 
        while l <= r:
            if m * m == x:
                break
            elif m * m < x:
                l = m + 1
            elif m * m > x:
                r = m - 1
            
            m = (l + r) // 2
        
        return m
```
So the thing with finding square root is that, we need to check with every number with binary search. We need to check every number and square it to see if that gives us the result. To do that, we just use binary search.

You know how to do binary search, don't you?
