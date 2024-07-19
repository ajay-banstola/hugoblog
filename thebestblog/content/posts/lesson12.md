+++
title = 'Add Binary'
date = 2024-07-18
+++


Here is the link to the problem: [Add Binary](https://leetcode.com/problems/add-binary/description/).

## Problem Statement:

Given two binary strings a and b, return their sum as a binary string.

### Examples:

**Example 1**:

**Input**: a = "11", b = "1"
**Output**: "100"

**Example 2**:

**Input**: a = "1010", b = "1011"
**Output**: "10101"


## My Solution

```python
class Solution(object):
    def addBinary(self, a, b):
        """
        :type a: str
        :type b: str
        :rtype: str
        """
        c = 0
        res = ""

        a_r, b_r = a[::-1], b[::-1]

        for i in range(max(len(a), len(b))):
            a_val = a_r[i] if i < len(a) else 0
            b_val = b_r[i] if i < len(b) else 0
            
            sum = c + int(a_val) + int(b_val)
            
            r = sum % 2
            
            c = sum // 2
            
            res += str(r)
            
        if c:
            return (str(c) + res[::-1])
        else:
            return res[::-1]
```
So even though this is an easy problem, but there are a lot of things to be considered. We add from right, so we reversed it. The loop goes to the maximum value of either a or b. If there is no value, replace it with 0. Add the sum including carry. The modulo 2 is the result and the integer division 2 is the carry. Add the result to the string. Lastly if only there is carry, add it to the last string value. Otherwise will fail in the case where there is single 0 in both a and b.

Also, checkout the Leetcode solution here:
```python
  class Solution:
	  def addBinary(self, a: str, b: str) -> str:
	    s = []
	    carry = 0
	    i = len(a) - 1
	    j = len(b) - 1
	
	    while i >= 0 or j >= 0 or carry:
	      if i >= 0:
	        carry += int(a[i])
	        i -= 1
	      if j >= 0:
	        carry += int(b[j])
	        j -= 1
	      s.append(str(carry % 2))
	      carry //= 2
	
	    return ''.join(reversed(s))
```

