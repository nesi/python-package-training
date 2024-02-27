---
layout: post
title: Numba
permalink: /python-scatter/numba
chapter: python-scatter
---

## Objectives

You will learn:

* what numba is
* how to accelerate code with numba

We'll use the code in the `numba` directory of the `scatter` repository.
Move there with the command
```
cd numba
```

## What is numba

Numba is Python module that translates a subset of Python and numpy code into fast machine code. Numba will allow you to develop code in Python while being able to reap the benefit of C code in terms of execution speed.

## Why use numba

Python often runs at least an order of magnitude slower than compiled C/C++ code and sometimes numpy vectorisation is not enough to get the performance boost you need.  In this case you will need to implement some parts of your code as C/C++ functions. With numba, you can tag slow functions, numba will translate these to C and compile the code automatically under the hood.

### Pros

 * there is no need to know how to program C
 * very little code change is required by the programmer, in general
 * works well with numpy arrays
 * numba supports multiple hardware (CPUs and GPUs), vectorisation, and can make your code run in parallel

### Cons

 * not all functions can be successfully processed by numba - if your function calls another function implemented in another Python module then the chances are that your function cannot be accelerated

## Learn the basics

As an example, we'll assume that you have to compute the sum of all the elements of an array:
```python
import numpy

def mysum(array):
    res = 0
    for i in range(len(array)):
        res += array[i]
    return res

# print the sum of 0, 1, ... 99999999
print(mysum(numpy.arange(0, 100000000)))
```
The following will convert `mysum` into a C callable function and compile the code:
```python
import numpy
from numba import jit

@jit(nopython=True)
def mysum(array):
    res = 0
    for i in range(len(array)):
        res += array[i];
    return res;

# print the sum of 0, 1, ... 99999999
print(mysum(numpy.arange(0, 100000000)))
```
The version with decorator `@jit(nopython=True)` runs 20x faster.

*Notes*:
 * be sure to pass a numpy array to `mysum`, passing a Python list will cause the numba version to run slower than the original version
 * it is possible to apply `@jit` decorators to loops that contain function calls. However, these functions need to be either implemented in C or have the `@jit` decorator

## How it works

Numba generates specialised, "just-in-time" code from Python source code.
In the above example, the Python function `mysum` is translated into C code,
then compiled and executed when you run the script.
The argument `nopython=True` to the jit decorator indicates that the generated
code will not access the Python interpreter. This produces the best performance
but requires that all argument types can be inferred, which may not always be the case.

*Note*: there is a one off cost when calling the function the first time. Translating the code from Python to C and compiling the C code will consume time.



> ## Exercises
> We've created a version of `scatter.py` in the `src/` directory
to which the numba decorator `@jit` can be freely added to file's functions.
The original version calls the Hankel function `hankel1` from `scipy.special`
and this prevents numba from generating jit code.
In the modified version we call the associated Bessel functions from the C++ Boost library.
Compile the code under `src/` using 
`python setup.py build` (make sure you have the `BOOST_DIR` environment set as described [here.](introduction))

> * profile *scatter.py* to get a baseline timing using the approach described [here](profiling)
> * incrementally add `@jit` decorators to the most time consuming functions. Start with the lowest level functions and move up the call stack
> * compare the performance with the original code

