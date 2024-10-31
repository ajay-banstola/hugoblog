+++
title = 'Basic linked list'
date = 2024-10-30
+++


Here is the link to the problem: [Basic Linked List](https://chatgpt.com/c/67214675-3040-800e-b3c2-f03cd344657d)

Creating a linked list in Python involves defining a structure to store each element (node) and then linking each node to the next one. Here’s a simple step-by-step explanation:

1. **Define the Node Class**:
   - Each node in a linked list contains some data and a reference to the next node in the list.
   - In Python, we can create a `Node` class to represent each element.

```python
class Node:
    def __init__(self, data):
        self.data = data  # Store the data
        self.next = None  # Reference to the next node (initially None)
```

2. **Define the LinkedList Class**:
   - We create a `LinkedList` class that manages the nodes.
   - This class will have a `head` attribute pointing to the first node in the list.

```python
class LinkedList:
    def __init__(self):
        self.head = None  # Start with an empty list (no head node yet)
```

3. **Add Methods to the LinkedList**:
   - Let’s add a method to insert data at the end of the list.

```python
    def append(self, data):
        new_node = Node(data)  # Create a new node
        if self.head is None:  # If the list is empty, make this the head node
            self.head = new_node
            return
        last = self.head
        while last.next:  # Traverse to the end of the list
            last = last.next
        last.next = new_node  # Link the last node to the new node
```

4. **Display the List**:
   - We can add a method to print all the elements in the list.

```python
    def display(self):
        current = self.head
        while current:  # Traverse through the list
            print(current.data, end=" -> ")
            current = current.next
        print("None")  # End of the list
```

5. **Using the Linked List**:
   - Now, we can create a linked list, add elements to it, and display it.

```python
# Create a LinkedList
ll = LinkedList()
ll.append(1)
ll.append(2)
ll.append(3)

# Display the LinkedList
ll.display()
```

### Output:
```
1 -> 2 -> 3 -> None
```

In summary:
- Each `Node` stores data and a link to the next node.
- The `LinkedList` class manages these nodes, starting from the `head`.
- We traverse the list by following the `next` pointers from one node to the next.
