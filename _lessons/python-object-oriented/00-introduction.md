---
layout: post
title: Introduction
permalink: /python-object-oriented/introduction
chapter: python-object-oriented
---

## Aim of this training

As Python has grown in popularity, the complexity of some Python packages has reached the point where their 
application programming interface no longer reduces to simple function calls. Such packages might have an 
_object oriented_ design. 

These packages are built around objects, i.e. data structures with attributes and methods, which allow the objects to be modified (or operate on other objects). Objects are created, have a life span and are destroyed when no longer used. During their life time, you can operate multiple times on the objects. Object oriented programming allows you to perform complex tasks, sometimes in more efficient way, than a procedural programming. It also tells the programmer which operations are allowed and which are not.

Consider for example a plotting package. Plotting data typically involves many fine grained operations (creating the plot, adding axis labels, title, legend etc.). On could write a function that performs all these oprations with a single call. However, this function would take a lot of arguments to control all the aspects of plotting. What if you wanted to change the title? You would have to call the function again with the same arguments except for one small change. This is error prone but also inefficient since most of the plot object was mostly fine and just needed minor tweaking.

In this training we'll introduce object oriented concepts usiong the `pandas` and `scikit-learn` packages. 

Upon completion of this training module, you will:

 * Understand when to apply object oriented programming
 * Be better equipped to navigate the documentation of  `pandas` and `scikit-learn`
 * Know what object members and methods are
 * How to implement a class in your project
 * Know how inheritance works

## Prerequisites

To take this training you will need:

 * To be able to log into a Unix computer, be comfortable with typing Unix commands
 * Know how to use an editor
 * Have some basic knowledge of Python

## Getting ready

We will require Python 3.x with `pandas` and `scikit-learn` installed.

### On your platform

You're welcome to use your own Python development platform, including that on your laptop. `pandas` and `scikit-learn` can be installed with the command
```bash
python -m venv venv
source activate venv
pip install pandas scikit-learn
```
using a virtual environment.

### On NeSI

If you choose to develop on NeSI, you can do so by 
```
module load Python
```

## Checking that your environment is working

The commands 
```bash
python -c "import sklearn"
python -c "import pandas
```
should succeed.



