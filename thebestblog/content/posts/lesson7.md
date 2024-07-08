+++
title = 'Remove duplicates from Sorted Array'
date = 2024-07-08
+++


Here is the link to the problem: [Remove Duplicates from sorted Array](https://leetcode.com/problems/remov-duplicates-from-sorted-array/description/).

## Problem Statement:

Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
Return k.

### Examples:

**Example 1**:

**Input**: nums = [1,1,2]

**Output**: 2, nums = [1,2,_]

**Explanation**: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).

**Example 2**:

**Input**: nums = [0,0,1,1,1,2,2,3,3,4]

**Output**: 5, nums = [0,1,2,3,4,_,_,_,_,_]

**Explanation**: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).


## My Solution


```python
class Solution(object):
    def removeDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        i = 0
        l = 1
        length_nums = len(nums)
        while l < length_nums:
            if nums[i] >= nums[l]:
                l += 1
            else:
                nums[i+1] = nums[l]
                i += 1
        
        return i+1

```

Here, since we need to remove duplicates in-place, i can't create another list and append items in it. The logic behind this is that we set two pointers where i will only increase if the items left to it is already set and l will increase to the right to check for duplicates. If found, we replace the item and increase index i as well. 

But surprisingly, it performed bad, i wonder why? 

Some of the better solutions from leetcode is given below:
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

Or this one,

```python
class Solution(object):
    def removeDuplicates(self, nums):
        nums[:]=list(set(nums))
        nums.sort()
        return len(nums)
```

Or this one,
```python
class Solution(object):
    def removeDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        unique_nums = list(sorted(set(nums)))
        
        for i in range(len(unique_nums)):
            nums[i] = unique_nums[i]
        return len(unique_nums)
```


