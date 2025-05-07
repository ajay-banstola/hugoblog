+++
title = 'Solution to 3sum problem and its edge cases'
date = 2024-07-03
+++


Here is the link to the problem: [Three Sum](https://leetcode.com/problems/3sum/description/).

## Problem Statement:

Given an integer array nums, return all the triplets `[nums[i], nums[j], nums[k]]` such that `i != j`, `i != k`, and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.

Notice that the solution set must not contain duplicate triplets.

### Examples:

**Example 1:**

Input: nums = `[-1,0,1,2,-1,-4]`

Output: `[[-1,-1,2],[-1,0,1]]`

Explanation: 

nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.

nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.

nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.

The distinct triplets are `[-1,0,1]` and `[-1,-1,2]`.
Notice that the order of the output and the order of the triplets does not matter.

**Example 2:**

Input: nums = `[0,1,1]`

Output: `[]`

Explanation: The only possible triplet does not sum up to 0.


**Example 3:**

Input: nums = `[0,0,0]`

Output: `[[0,0,0]]`

Explanation: The only possible triplet sums up to 0.

# Solution to 3sum problem and its edge cases 

### 1. Without considering any edge cases:

Let's devise a solution using sliding window technique. Here, we consider three pointers, where other two pointers get decreased or increased based on the value of the sum of the elements. The l value should be 1 greater than i and i should be increased through loop. 
```python
a = [-1,0,1,2,-1,-4]
result = []
a.sort()
length = len(a)
for i in range(length):
  l = i + 1
  r = len(a) - 1
  while l< r:
    sum_three = a[i] + a[l] + a[r]
    if sum_three > 0:
      r -= 1
      elif sum_three < 0:
        l += 1
        else:
        result.append([a[i], a[l], a[r]])
        l += 1
        r -= 1
        
print(result)
```
This solution almost works but not quite well. Can you find the problem here? Let's see an example to be clear.

### 2. Failed case without condition i>0

The case where the solution given above fails is explained below.

**Case**: `[0,0,0]`

**Expected output**: `[0,0,0]`

**Output**: []

The reason why this condition fails is because for i=0, `a[i] == a[i-1]` where `a[0] == a[-1]`. We don't want to check for duplicate when i=0. It compares with last element instead of previous element. 

Case: `[-2, 4, -2]` doesn't fail even though it looks like it would fail is because it gets sorted so the list becomes `[-2,-2, 4]` so the only case that fails if we remove condition `i> 0` is `[0,0,0]`.

### 3. Failed case without condition `a[i] == a[i-1]`

**Case**: `[-1, 0, 1, 2, -1, -4]`

**Expected output**: `[[-1, -1, 2], [-1, 0, 1]]`

**Output**: `[[-1, -1, 2], [-1, 0, 1], [-1, 0, 1]]`


It is because after sorting, the value of i is -1 for two times. So there is two lists with i as -1 and causes duplicates.

### 4. Failed case without *while* condition 

**Case**: `[-2,0,0,2,2]`

**Expected Output**: `[[-2, 0, 2]]`

**Output**: `[[-2, 0, 2], [-2, 0, 2]]`


The reason is that since we checked duplicate for i pointer. We need to check duplicate for l and r pointer as well. Well, checking either of l or r also works, let me know if you find any test cases where this is not the case, I would be glad to find out. But we will keep both the conditions to be on the safe side. 

### 5. Final solution handling all the test cases

```python
a = [-2,0,2]
result = []
a.sort()
length = len(a)
for i in range(length):
  l = i + 1
  r = len(a) - 1
  # First condition
  if i>0 and a[i] == a[i-1]:
    continue
  while l< r:
    sum_three = a[i] + a[l] + a[r]
    if sum_three > 0:
      r -= 1
    elif sum_three < 0:
      l += 1
    else:
      result.append([a[i], a[l], a[r]])
      l += 1
      r -= 1
      # Second condition
      while l< r and nums[l] == nums[l-1]:
        l += 1
      # Third condition
      while l< r and nums[r] == nums[r+1]:
        r -= 1

print(result)
```

