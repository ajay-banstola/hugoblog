+++
title = 'Single Number'
date = 2024-07-26
+++


Here is the link to the problem: [Single Number](https://leetcode.com/problems/single-number/description/).

## Problem Statement:

Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

You must implement a solution with a linear runtime complexity and use only constant extra space.

### Examples:

**Example 1**:

**Input**: nums = [2,2,1]

**Output**: 1

**Example 2**:

**Input**: nums = [4,1,2,1,2]

**Output**: 4

**Example 3**:

**Input**: nums = [1]

**Output**: 1

## My Solution

### Using XOR operator

```python
class Solution(object):
    def singleNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        res = 0
        for each in nums:
            res ^= each

        return res
```

This is a very interesting problem. We have to first know how the XOR operator works. XOR beautifully segregates the odd one out. We start with res as 0 and we do XOR operation in each of the element and at last only the odd one remains. 

It's like this, in a group of friends if we do XOR operation to each one of them, only you will remain at last because you are the one and only single lonely ass in this world, aren't you? 

### Using dictionary

```python
class Solution(object):
    def singleNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        new_dict = {}
        for each in nums:
            if each in new_dict:
                new_dict[each] += 1
            else:
                new_dict[each] = 1

        for each in new_dict:
            if new_dict[each] == 1:
                return each
```


Notice here to get the element from dictionary we need another for loop as well.
