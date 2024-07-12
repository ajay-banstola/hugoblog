+++
title = 'Search Insert Position'
date = 2024-07-12
+++


Here is the link to the problem: [Search Insert Position](https://leetcode.com/problems/search-insert-position/description/)

## Problem Statement:

Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You must write an algorithm with O(log n) runtime complexity.

### Examples:

**Example 1**:

**Input**: nums = [1,3,5,6], target = 5

**Output**: 2

**Example 2**:

**Input**: nums = [1,3,5,6], target = 2

**Output**: 1

**Example 3**:

**Input**: nums = [1,3,5,6], target = 7

**Output**: 4

## My Solution

```python
class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        l = 0
        r = len(nums) - 1

        while l <= r:
            m = (l+r)//2
            if nums[m] == target:
                return m
            elif nums[m] > target:
                r = m - 1
            else nums[m] < target:
                l = m + 1

        return l

```

In this solution, we have two pointers l and r. take m as middle point and alter r and l based on the value of the list. 

Remember to subtract 1 from m so that the m value is not counted again. This helps in extreme cases of minimum and maximum.


Some other solutions found in leetcode:

```python
class Solution:
  def isValid(self, s: str) -> bool:
    stack = []
    closeToOpen = {")": "(", "]":"[", "}":"{"}

    for c in s:
      if c in closeToOpen:
        if stack and stack[-1] == closeToOpen[c]:
          stack.pop()
        else:
          return False
      else:
        stack.append(c)

    return True if not stack else False

```
```python
class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        low=0
        high=len(nums)-1
        ans=high+1
        while low<=high:
            mid=(low+high)//2
            if nums[mid]>=target:
                ans=mid
                high=mid-1
            else:
                low=mid+1
        return ans
```


