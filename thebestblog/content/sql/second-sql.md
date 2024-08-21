+++
title = 'Average time of Process per Machine'
date = 2024-08-21
+++



Here is the link to the problem: [Average time of Process per Machine](https://leetcode.com/problems/average-time-of-process-per-machine/description/).

## Problem Statement:

**Table: Activity**


| Column Name| Type|
| -------- | ------- |
| machine_id | int |
| process_id | int |
| activity_type | enum|
| timestamp| float|


There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.

The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.

The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.

Return the result table in any order.

The result format is in the following example.

### Examples:

Input: 
Explanation: 
There are 3 machines running 2 processes each.
Machine 0's average time is ((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894
Machine 1's average time is ((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995
Machine 2's average time is ((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456

## My Solution

```sql
select a1.machine_id, round(avg(a2.timestamp-a1.timestamp),3) as processing_time
from Activity a1
join Activity a2
on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id
and a1.activity_type = 'start' and a2.activity_type = 'end'
group by machine_id```

**Step by step explanation of the solution:**

We don't need sum or difference function, just to avg for average function. round it to 3 decimal places. join the table itself with both machine_id and process_id. 
And also the a1 activity_type should be start and a2 activity_type should be end because we are taking difference from a2 to a1. Lastly group by machine_id.

