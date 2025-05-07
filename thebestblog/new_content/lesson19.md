+++
title = 'Valid Sudoku'
date = 2024-08-19
+++


Here is the link to the problem: [Valid Sudoku](https://leetcode.com/problems/valid-sudoku/description/).

## Problem Statement:

Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

- Each row must contain the digits 1-9 without repetition.

- Each column must contain the digits 1-9 without repetition.

- Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.

Note:

A Sudoku board (partially filled) could be valid but is not necessarily solvable.
Only the filled cells need to be validated according to the mentioned rules.

### Examples:

**Example 1**:

Input: board = 
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]

Output: true

## My Solution

```python
class Solution(object):
    def isValidSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: bool
        """
        cols = collections.defaultdict(list)
        rows = collections.defaultdict(list)
        box = collections.defaultdict(list)

        for r in range(9):
            for c in range(9):
                if board[r][c] == ".":
                    continue
                if board[r][c] in rows[r] or board[r][c] in cols[c] or board[r][c] in box[r//3, c//3]:
                    return False
                else:
                    rows[r].append(board[r][c])
                    cols[c].append(board[r][c])
                    box[r//3,c//3].append(board[r][c])
        
        return True
```

Here, defaultdict is a dict that sets a default value without us explicitely mentioning. So for each element in the sudoku, if it is already in the defaultdict, return False else append to the default dicts. Note that for `box` we do r//3 and c//3 so that the box is a box of 3*3 grid. (6//3, 6//3) = (2,2) so it falls in (2,2) index of bigger grid.
