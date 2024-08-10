+++
title = 'Sorting items in a nested dictionary'
date = 2024-08-10
+++

## Problem Statement:

We want to sort items in a dictionary by a value that is nested deep in the dictionary. Let's take an example:

**Dictionary to be sorted:**

```python
dict_v = {
    "1": {"A":1},
    "2": {"B":2},
    "3": {"C":6},
    "4": {"D":4}
}
```
Here, we want to sort the dictionary by the values 1,2,6 and 4. Let's call "1", "2","3", "4" as `key`, "A", "B","C", "D" as `field` and 1,2,6,4 as `values`. We want to sort the dictionary by values and that also in descending order. 

To achieve this, we need to use lambda function. We will see the solution first, then discuss about it later.

**Solution:**

```python
sort_keys = sorted(
    dict_v.items(),
    key = lambda item: list(item[1].values())[0],
    reverse = True
    )
```

**Output:**

[('3', {'C': 6}), ('4', {'D': 4}), ('2', {'B': 2}), ('1', {'A': 1})]

If we want to return it as dictionary,

```python
sort_keys = dict(sorted(
    dict_v.items(),
    key = lambda item: list(item[1].values())[0],
    reverse = True
    )
)
```

**Output:**

{'3': {'C': 6}, '4': {'D': 4}, '2': {'B': 2}, '1': {'A': 1}}

**Explanation:**

1. dict_v.items():

- dict_v is your original dictionary.

- The .items() method returns a view object that displays a list of the dictionary's key-value pairs in the format of tuples.

- For example, for your dictionary dict_v, dict_v.items() would return:

```python
[
    ('1', {'A': 1}),
    ('2', {'B': 2}),
    ('3', {'C': 6}),
    ('4', {'D': 4})
]
```
This is a list of tuples where each tuple contains a key from dict_v and its corresponding value (which is another dictionary).

2. sorted(..., key = ..., reverse = True):

- The sorted() function is used to sort the items. It can sort based on a custom key by specifying a key argument.

- reverse = True indicates that we want the sorting in descending order (highest value first).

3. key = lambda item: list(item[1].values())[0]:

- Here, key is a function that defines the sorting criteria. It's a lambda function in this case.

- item is each element from dict_v.items(). So, item is a tuple, e.g., ('1', {'A': 1}).

- item[0] would give you the key of the dictionary, and item[1] would give you the value, which is a nested dictionary.

- item[1].values() extracts all the values from the nested dictionary (e.g., {1}, {2}, {6}, {4}), and list(item[1].values())[0] converts that into a list and retrieves the first value.

- So, lambda item: list(item[1].values())[0] returns the value inside the nested dictionary for each tuple. For example:

- For ('1', {'A': 1}), it returns 1.

- For ('2', {'B': 2}), it returns 2 and so on.

4. Result:

- sorted() uses the values returned by the lambda function to sort the items in descending order.

- The sorted result is stored in sort_keys.


