+++
title = 'Valid Palindrome'
date = 2024-07-25
+++


Here is the link to the problem: [Valid Palindrome](https://leetcode.com/problems/valid-palindrome/description/).

## Problem Statement:

A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

### Examples:

**Example 1**:

**Input**: s = "A man, a plan, a canal: Panama"

**Output**: true

**Explanation**: "amanaplanacanalpanama" is a palindrome.

**Example 2**:

**Input**: s = "race a car"

**Output**: false

**Explanation**: "raceacar" is not a palindrome.

**Example 3**:

**Input**: s = " "

**Output**: true

**Explanation**: s is an empty string "" after removing non-alphanumeric characters.

Since an empty string reads the same forward and backward, it is a palindrome.

## My Solution

```python
class Solution(object):
    def isPalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """
        s = ''.join(char.lower() for char in s if char.isalnum())
        if s == s[::-1]:
            return True
        else:
            return False
```

This is quite simple one. I just used `join` to remove all characters besides Alphanumeric characters. **NOTE**: if it was to only check for alphabets, we would have used `isalpha()` instead of `isalnum()`. 

Later, we check if the string and its reverse is the same.
