+++
title = 'Merge sorted array'
date = 2024-07-24
+++


Here is the link to the problem: [Merge Sorted Array](https://leetcode.com/problems/merge-sorted-array/description/).

## Problem Statement:

You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

Merge nums1 and nums2 into a single array sorted in non-decreasing order.

The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.


### Examples:

**Example 1**:

**Input**: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3

**Output**: [1,2,2,3,5,6]

**Explanation**: The arrays we are merging are [1,2,3] and [2,5,6].

The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.

**Example 2**:

**Input**: nums1 = [1], m = 1, nums2 = [], n = 0

**Output**: [1]

**Explanation**: The arrays we are merging are [1] and [].
The result of the merge is [1].

**Example 3**:

**Input**: nums1 = [0], m = 0, nums2 = [1], n = 1

**Output**: [1]

**Explanation**: The arrays we are merging are [] and [1].
The result of the merge is [1].

Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.

## My Solution


```python
class Solution(object):
    def merge(self, nums1, m, nums2, n):
        """
        :type nums1: List[int]
        :type m: int
        :type nums2: List[int]
        :type n: int
        :rtype: None Do not return anything, modify nums1 in-place instead.
        """
        k = m + n - 1

        while m >0 and n>0:
            if nums1[m-1] >= nums2[n-1]:
                nums1[k] = nums1[m-1]
                m -= 1
            else:
                nums1[k] = nums2[n-1]
                n -= 1
            k -= 1
        
        while n > 0:
            nums1[k] = nums2[n - 1]
            n -= 1
            k -= 1

        return nums1
```

There is a very good graphic representation of the problem in the description of the leetcode problem. Please look at it.

We are having three pointers. m and n are for each of the list and k is for last item in nums1. We compare element from both lists in index m and n and based on that, we set it in the k index. 

The problem is with the third test case, there is a weird behaviour because leetcode somehow treats the length of nums1 and nums2 differently so k is not len(nums1) -1 but it is m + n -1. Also to handle the third case, we added second while loop and to be honest I have no idea how does it work. I asked chatgpt that's it.

I ALSO DON'T WANT TO POST OTHER SOLUTIONS BECAUSE THEY ALL ARE BULLSHIT.

