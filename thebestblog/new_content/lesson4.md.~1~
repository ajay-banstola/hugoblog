+++
title = '3Sum Closest Solution: Me vs ChatGPT'
date = 2024-07-04
+++


Here is the link to the problem: [3Sum Closest](https://leetcode.com/problems/3sum-closest/description/).

## Problem Statement:

Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

Return the sum of the three integers.

You may assume that each input would have exactly one solution.


### Examples:

**Example 1:**

Input: nums = `[-1,0,1,2,-1,-4]`

Target: 1

Output: `2`


Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2)

**Example 2:**

Input: nums = `[0,0,0]`

Target: 1

Output: `0`

Explanation: The sum that is closest to the target is 0. (0 + 0 + 0 = 0)


# Solution to 3sum-closest problem: Me vs ChatGPT 


### My Solution 

So this problem is very similar to the 3sum problem. Only thing is that we need to track the value of sum of three numbers and also the minimum value from all of them. Otherwise the logic is similar to the one we did in 3sum problem using two pointers.
The float('inf') is so that the minimum value is set to maximum at first. If we find the minimum we simultaneously update the final sum as well. 

```python
length_nums = len(nums)-1
nums.sort()
sum_diff_min =  9999999999999
for i in range(length_nums):
    l = i+1
    r = length_nums
    if i>0 and nums[i] == nums[i-1]:
        continue
    while l<r:
        sums_ar = nums[i] + nums[l] + nums[r]
        if sum_diff_min > abs(sums_ar - target):
            sum_diff_min = abs(sums_ar - target)
            final_sum = sums_ar
        
        if sums_ar > target:
            r -= 1
        elif sums_ar < target:
            l += 1
        else:
            l += 1
            r -= 1
            if l < r and nums[l] == nums[l-1]:
                continue
            if l < r and nums[r] == nums[r+1]:
                continue
            
return final_sum
```
My solution beats 85% of leetcode users with runtime of just 434 seconds.


I also gave ChatGPT to optimize this solution. Let's look at the solution from chatGPT.

```python

def threeSumClosest(self, nums, target):
    """
    :type nums: List[int]
    :type target: int
    :rtype: int
    """
    nums.sort()
    closest_sum = float('inf')
    
    for i in range(len(nums) - 2):
        if i > 0 and nums[i] == nums[i - 1]:
            continue
        l, r = i + 1, len(nums) - 1
        while l < r:
            current_sum = nums[i] + nums[l] + nums[r]
            if current_sum == target:
                return current_sum
            if abs(current_sum - target) < abs(closest_sum - target):
                closest_sum = current_sum
            if current_sum < target:
                l += 1
            else:
                r -= 1
    
    return closest_sum

```


Here is the explanation from chatGPT:

### Improvements and Optimizations:


#### Initialization and Sorting:

Sort the list at the beginning to use the two-pointer technique effectively.


#### Closest Sum Tracking:

Use float('inf') for initialization to ensure any found sum will be closer.
Update the closest sum if the current sum is closer to the target.

#### Main Loop and Two-pointer Technique:

Loop through the sorted list, skipping duplicates to avoid unnecessary checks.
Use two pointers (l and r) to find the closest sum for each i.

#### Target Check:

If the current sum equals the target, return immediately.
Move pointers based on the comparison of current_sum and target.

**Runtime** : 496 ms

Beats 40% of leetcode users.

The heck is wrong with you chatGPT? Do better.

Just kidding. You know I love you.


