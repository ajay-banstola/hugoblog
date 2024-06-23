+++
title = 'Three ways to solve the 2-sum problem'
date = 2024-06-23
+++

Here is the link to the problem: [Two Sum](https://leetcode.com/problems/two-sum/description/).

## Problem Statement:

Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

### Examples:

**Example 1:**

Input: `nums = [2,7,11,15]`, `target = 9`

Output: `[0,1]`

Explanation: Because `nums[0] + nums[1] == 9`, we return `[0, 1]`.

**Example 2:**

Input: `nums = [3,2,4]`, `target = 6`

Output: `[1,2]`

**Example 3:**

Input: `nums = [3,3]`, `target = 6`

Output: `[0,1]`

# Three Ways to Solve the 2-sum Problem

### 1. Using Brute Force:

The simplest but the least efficient way is to use brute force. Here, we will have two nested loops which will go through each of the elements and check if the sum equals the target.

```python
nums = [2, 7, 11, 15]
target = 9
length_nums = len(nums)
for i in range(length_nums):
    for j in range(i + 1, length_nums):
        if nums[i] + nums[j] == target:
            new_list = [i, j]

print(new_list)
# Output: [0, 1]
```

## Optimizing the Two Sum Problem

### Initial Solution: Nested Loops

**Time Complexity:** O(n^2)  
**Space Complexity:** O(1)  

The initial solution uses nested loops, which results in a time complexity of O(n^2). While this approach is straightforward, it is not efficient for large datasets.

### 2. Improved Solution: Sliding Window

Using a sliding window approach can optimize the solution. Here, we sort the list and use two pointers to find the target sum.

```python
nums = [2, 7, 11, 15]
target = 9

sorted_nums_with_indices = sorted((j, i) for i, j in enumerate(nums))  # note j, i and not i, j
# [(2, 0), (7, 1), (11, 2), (15, 3)]
sorted_nums, sorted_indices = zip(*sorted_nums_with_indices)
# (2, 7, 11, 15) (0, 1, 2, 3)
length_nums = len(nums) - 1
# 3
l = 0
r = length_nums
# l and r need to be out of the loop 

for i in range(length_nums):
    # range should have length_nums-1 
    # we need index so we are using sorted_nums and sorted_indices
    
    # ignore redundancy
    if sorted_nums[l] == sorted_nums[l-1] or sorted_nums[r] == sorted_nums[r-1]:
        continue
    
    if sorted_nums[l] + sorted_nums[r] > target:
        r -= 1
    elif sorted_nums[l] + sorted_nums[r] < target:
        l += 1
    else:
        new_list = [sorted_indices[l], sorted_indices[r]]
        # don't forget to subtract and add to ignore redundancy
        r -= 1
        l += 1
        
print(new_list)
# [0, 1]
```


This solution is better than before.

**Time Complexity:** O(nlogn)  
**Space Complexity:** O(n) 

But we can do better than this. The secret is to use the hashmap. Thus, we move towards the third, and the final solution to our problem.

Here we find compliment of each number, if it exists in dictionary that we created, we add the index to a list, otherwise we add number and index to the dictionary.

### 3. Using hashmap:

```python
new_dict = {}

for i, val in enumerate(nums):
    compliment_num = target - val
    if compliment_num in new_dict:
        new_list = [new_dict[compliment_num],i]
    else:
        new_dict[val] = i

print(new_list)
# [0,1]

```

**Time Complexity: O(n)** 

Iterating through the list: 
O(n)
Checking for the complement in the dictionary and inserting a new entry: 

O(1) on average for each operation

Overall time complexity: O(n)

**Space Complexity: O(n)**

Storing the dictionary with up to n elements: O(n)

Overall Space complexity: O(n)

