+++
title = 'Length of Last word'
date = 2024-07-13
+++


Here is the link to the problem: [Length of Last word](https://leetcode.com/problems/length-of-last-word/description/).

## Problem Statement:

Given a string s consisting of words and spaces, return the length of the last word in the string.

A word is a maximal substring consisting of non-space characters only.

### Examples:

**Example 1**:

**Input**: s = "Hello World"

**Output**: 5

**Explanation**: The last word is "World" with length 5.

**Example 2**:

**Input**: s = "   fly me   to   the moon  "

**Output**: 4

**Explanation**: The last word is "moon" with length 4.

**Example 3**:

**Input**: s = "luffy is still joyboy"

**Output**: 6

**Explanation**: The last word is "joyboy" with length 6.

## My Solution

```python
class Solution(object):
    def lengthOfLastWord(self, s):
        """
        :type s: str
        :rtype: int
        """
        a = s.strip()
        i = 0
        for each in a[::-1]:
            if each == ' ':    
                break
            else:
                i += 1
            
        return i
```

So the logic with this is that we strip the empty space in the string first. Then we start from the end of the string and we come to the start of the sting. Unless the character is space, we increase the i value, otherwise we just break out of the loop. 

The loop stops itself when the pointer to the string is in the first character of the string.

Some other solutions from the leetcode:

**Solution 1**:

```python
class Solution(object):
    def lengthOfLastWord(self, s):
        """
        :type s: str
        :rtype: int
        """
        return len(s.split()[-1])
```

**Solution 2**:
```python
class Solution(object):
    def lengthOfLastWord(self, s):
        """
        :type s: str
        :rtype: int
        """
        s = s.strip()
        if len(s) == 0:
            return 0
        return len(s.split()[-1])
```
