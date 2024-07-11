+++
title = 'Index of First Occurennce in String'
date = 2024-07-11
+++


Here is the link to the problem: [Index of First Occurrence in String](https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/)

## Problem Statement:

Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.


### Examples:

**Example 1**:

**Input**: haystack = "sadbutsad", needle = "sad"

**Output**: 0

**Explanation**: "sad" occurs at index 0 and 6.
The first occurrence is at index 0, so we return 0.

**Example 2**:

**Input**: haystack = "leetcode", needle = "leeto"

**Output**: -1

**Explanation**: "leeto" did not occur in "leetcode", so we return -1.

## My Solution

```python
class Solution(object):
    def strStr(self, haystack, needle):
        """
        :type haystack: str
        :type needle: str
        :rtype: int
        """
        l = 0
        r = len(needle)
        length = len(haystack)
        while r <= length:
            if needle == haystack[l:r]:
                return l
            l += 1
            r += 1
```

My logic is simple, l would be 0 and r would be whatever the length of the needle. We check if needle matches the slice of word from the haystack if it does we return 1 else -1. We increase l and r accordingly. Also, this condition should continue until the length of r is less than or equal to length of the haystack.


Some other solutions I found in leetcode:

```python
class Solution(object):
    def strStr(self, haystack, needle):
        """
        :type haystack: str
        :type needle: str
        :rtype: int
        """
        if needle in haystack:
            return haystack.index(needle)
        return -1
```

```python
class Solution(object):
    def strStr(self, haystack, needle):
        """
        :type haystack: str
        :type needle: str
        :rtype: int
        """
        for i in range(0, len(haystack)-len(needle)+1):
            if haystack[i:i+len(needle)] == needle:
                return i
        return -1

```

Also, interesting comment that I found in the description.

"""
Who marked this as Easy? It's not easy at all. Though you can easily produce O(mn) solution, it is not accepted for python. You need **KMP** algorithm to produce O(m + n) solution!
"""
