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
`LinearRegression` is a class. Class names often start with a capital letter. A class denotes a type, in this case a type linear model regression

## What is an instance of a class

An instance of a class is a particular realisation of a given class. Sometimes an instance is simply referred to as an object. In the code below
```python
mymodel = LinearRegression(fit_intercept=False)
```
we create model called `mymodel` by creating an instance of class `LinearRegression`. There can be many instances of the same type. For instance, we might have 
```python
model1 = LinearRegression(positive=False)
model2 = LinearRegression(positive=True)
```
Both `model1` and `model2` are of type `LinearRegression`.


## What is a member

Objects can have attributes, values that are attached to them. For instance,
```python
model1.positive
```
will print `False`.

## What is a method

An object can also have functions, which apply to the object. These are called methods and they may take arguments. For instance,
```python
model1.fit(X=[[1,],[2,]], y=[1, 2])
```

> ## Exercises

> * Find another class of linear regression model from the `sklear` documentation
> * Instantiate an object from the above class
> * From the documentation, list some members and some methods of this class

