+++
title = 'Customers who never order'
date = 2024-08-01
+++


Here is the link to the problem: [Customers who never order](https://leetcode.com/problems/customers-who-never-order/description/).

## Problem Statement:

Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID and name of a customer.
 

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
customerId is a foreign key (reference columns) of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
 

Write a solution to find all customers who never order anything.

Return the result table in any order.

The result format is in the following example.

### Examples:

**Example 1**:

Example 1:

**Input**: 

**Customers table**:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+

**Orders table**:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+

**Output**: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+



## My Solution

```sql
# Write your MySQL query statement below
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;
```

**Step by step explanation of the solution:**

First, what if we do `join` only instead of `left join`? Not all customers have orders so the join will have Null value in the orders' columns. But we want those names who don't have orders. So we did `left join`. Also, now we filter those ids which have `NULL` using the where clause. LEFT JOIN is to first join values where left tables' all rows are reflected. Then `WHERE` clause is used to filter out records from the output table.
