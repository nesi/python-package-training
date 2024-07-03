---
layout: post
title: What is object oriented programming?
permalink: /python-object-oriented/whatisoo
chapter: python-object-oriented
---

## Objectives



You will learn:

* What is a class
* What is an object
* What is a member
* What is a method

## What is a class

A class defines the type of an object. In the example below
```python
from sklearn.linear_model import LinearRegression
```
`LinearRegression` is a class. A class denotes a type, in this case a linear regression type. 

We can think of a class as the analogy to the brand of a consumer good. For example, the class of a handbag may be "Gucci". 

_Hint: In sklearn and other packages, class names start with a capital letter_

## What is an instance of a class

An _instance_ is a particular realisation of a class. Sometimes an instance is simply referred to as an object. 

To pursue our handbag analogy, an instance would be a particular handbag. There may be many handbags of the same class, which may be slightly different but all carry the "Gucci" brand. 

In the code below
```python
mymodel = LinearRegression(fit_intercept=False)
```
we create model called `mymodel` by creating an instance of class `LinearRegression`. It is possible to cerate multiple instances of the same class, e.g.
```python
model1 = LinearRegression(positive=False)
model2 = LinearRegression(positive=True)
```
Both `model1` and `model2` are of type `LinearRegression`.


## What is a member

Objects can have properties and these can be accessed using the `.` notation. For instance,
```python
model1.positive
```
will print `False`.

_Notes_
 1. _a `.` may also denote a name space in Python, e.g. `foo.bar()` calls function `bar` in module `foo`_
 2. _a member is often a noun, e.g. `material`, `size`..._

## What is a method

An object can also have (member) functions, which apply to the object. These are called methods and they may take arguments. 

As in the case of members, methods can be accessed using the `.` notation. Note in the example below how instance `model` calls method `fit`, which takes arguments `X` and `y`:
```python
model1.fit(X=[[1,],[2,]], y=[1, 2])
```

_Note: a method is often a verb, e.g. `carry`, `buy`,..._

> ## Exercises

> * Find another class of linear regression model from the `sklearn` documentation
> * Instantiate an object from the above class
> * From the documentation, list some members and some methods of this class

