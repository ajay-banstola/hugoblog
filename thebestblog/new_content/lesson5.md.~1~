+++
title = 'Valid Parentheses Solution: Me vs Neetcode'
date = 2024-07-05
+++


Here is the link to the problem: [Valid Parentheses](https://leetcode.com/problems/valid-parentheses/description/).

## Problem Statement:

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.

### Examples:

**Example 1**:

Input: s = "()"

Output: true

**Example 2**:

Input: s = "()[]{}"

Output: true

**Example 3**:

Input: s = "(]"

Output: false


## My Solution


```python
class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        new_list = []
        new_dict = {')': '(', ']':'[', '}':'{'}

        if len(s) == 1:
            return False

        if s[0] == ')' or s[0] == '}' or s[0] == ']':
            return False

        for each in s:
            if each == '(' or each == '{' or each == '[':
                new_list.append(each)
                continue
            index = len(new_list) - 1
            if index >= 0:
                if new_dict.get(each) == new_list[index]:
                    new_list.pop()
                else:
                    return False
            else: 
                return False

        if new_list == []:
            return True
        else:
            return False
```

So I created a list which acts as a stack. Whenever I see an opening bracket i push it into the list and whenever I see a closing bracket, I pop it out of the list. At last if the list is empty that means the string is valid, otherwise not.

But there are improvements that can be done in this code. Like how there is no need of a lots of return Statement. Also to check for opening Parentheses, there is a shorter way. Neetcode is a Youtuber who solves this kinds of problems. I have attached his solution below and we can see what improvements can be done in the above code. 

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

