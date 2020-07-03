---
title: "Two Sum Problem"
date: 2020-06-30T17:55:26-05:00
draft: false
categories: ['Interview Questions']
tags: ['interview', 'python', '2-sum']
keywords: ['interview', 'python', '2-sum']

---

Two sum problem is a common tech interview question that goes like this:

Given an array of numbers and a target value, find the indices of two numbers that add up to the target.

Example: given the array [-1,0,6,5,2] and the target value of 11, you are expected to return [2,3] the indices of 6 and 5.

Do you have all the info needed to get started with coding? The following are some of the questions that you can ask:

1. Is the array sorted? Your life becomes a lot easy if it is. Unfortunately, your interview says it's not.
1. Will the numbers repeat? Interviewer says no. All numbers are unique.
1. Will there be more than one answer set possible? In the real world, yes. But for the sake for this interview you can consider there will only be one possible answer set.

#### Approach 1: Brute force
We take each element, compare it against the rest of the array and see if it adds up to target. If it does, break out of the loop and return the indices.

```python
def two_sum(arr, target):
    for i in range(len(arr)):
        for j in range(i+1, len(arr)):
            if arr[i] + arr[j] == target:
                return [i,j] 
```

Now this works, but the time complexity is O(n<sup>2</sup>) as we have to loop through the array for each element in the array. The space complexity is O(1).

#### Approach 2: Introduce a dictionary
What's killing us wrt time complexity in Approach 1 is that our method to check whether a complement number exist in the array involves going over the entire array again. What if we can store the entire array in a dictionary which will enable a lookup in O(1) time instead of O(n) time?

```python
def two_sum(arr, target):
    lookup = {}
    for index, value in enumerate(arr):
        lookup[value] = index
    for index, value in enumerate(arr):
        complement = target-value
        if (complement) in lookup.keys():
            return [index, lookup[complement]]
    #no match found
    return []
```

In the first pass, we populate a dictionary and in the second pass we check whether a complement for the number exists in the dictionary or not. We have gained a better run time complexity of O(n) but at the cost of space time complexity which is now O(n) as we are now storing the copy of the entire array in a dictionary


#### Approach 3: Single pass dictionary lookup
If you carefully analyze Approach 2, you will see that we can get this done in one pass. As we insert elements into the dictionary, we check the dictionary to see if the complement is already present:

```python
def two_sum(arr, target):
    lookup = {}
    for index,value in enumerate(arr):
        complement = target-value
        if (complement) in lookup.keys():
            return [index, lookup[complement]]
        else:
            lookup[value] = index
    #no match found
    return []
```

Time complexity: O(n)
Space complexity: 0(n)

