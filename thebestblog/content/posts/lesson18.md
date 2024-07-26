+++
title = 'Majority Element'
date = 2024-07-26
+++


Here is the link to the problem: [Majority Element](https://leetcode.com/problems/majority-element/description/).

## Problem Statement:

Given an array nums of size n, return the majority element.

The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

### Examples:

**Example 1**:

**Input**: nums = [3,2,3]
**Output**: 3

**Example 2**:

**Input**: nums = [2,2,1,1,1,2,2]
**Output**: 2

## My Solution

```python
class Solution(object):
    def majorityElement(self, nums):
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
            if new_dict[each] > len(nums)/ 2:
                return each
```
This is nothing, very simple. Added count of elements to a dictionary and then based on the count, we return the element.
