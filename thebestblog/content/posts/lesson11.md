+++
title = 'Plus one'
date = 2024-07-13
+++


Here is the link to the problem: [Plus one](https://leetcode.com/problems/plus-one/description/).

## Problem Statement:

You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

Increment the large integer by one and return the resulting array of digits.

### Examples:

**Example 1**:

**Input**: digits = [1,2,3]

**Output**: [1,2,4]

**Explanation**: The array represents the integer 123.
Incrementing by one gives 123 + 1 = 124.
Thus, the result should be [1,2,4].

**Example 2**:

**Input**: digits = [4,3,2,1]

**Output**: [4,3,2,2]

**Explanation**: The array represents the integer 4321.
Incrementing by one gives 4321 + 1 = 4322.
Thus, the result should be [4,3,2,2].

**Example 3**:

**Input**: digits = [9]

**Output**: [1,0]

**Explanation**: The array represents the integer 9.
Incrementing by one gives 9 + 1 = 10.
Thus, the result should be [1,0].

## My Solution
```python
class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        total_str = ''
        new_list = []
        for each in digits:
            total_str += str(each)
            
        total_int = int(total_str) + 1
        total_str = str(total_int)
        for t in total_str:
            new_list.append(int(t))

        return new_list
```

So in this solution, there is a lot of conversion happening. To concatenate the digits i converted them to string first, then to add a number to it, it converted them to int. Then again to make it a list, i converted the int value to string and for each element in the string I converted them to int and append in a list. Pheww. Lots of conversion I tell you.

I have also attached few of the leetcode and Chatgpt solutions here.

```python
class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        # Traverse the list from the last element to the first
        for i in range(len(digits)-1, -1, -1):
            # If the current digit is 9, set it to 0
            if digits[i] == 9:
                digits[i] = 0
            else:
                # If the current digit is not 9, increment it by 1 and return the list
                digits[i] = digits[i] + 1
                return digits
        # If all digits are 9, prepend 1 to the list
        return [1] + digits
```

Solution by Chatgpt:

```python
a = [1, 2, 9]
total_int = int(''.join(map(str, a))) + 1
new_list = [int(digit) for digit in str(total_int)]
print(new_list)
```
