---
layout: post
title: Locking down the build environment
permalink: /python-package/environment
chapter: python-package
---

## Objectives

A typical Python package will depend on other Python packages. The list of Python dependencies can be 
long and it is often advisable to nail down these dependencies to produce a well defined environment. 
Here we show how to generate a reproducible development environment, which will be identical between 
developers.

You will learn:

* How to create and activate a Python virtual environment that contains the package dependencies of your project
* How to extend your environment
* How to deactivate your environment

## Why you should use a virtual environment

A virtual environment is a minimalistic environment that contains just the dependencies your project 
needs. This minimises the risk of package conflict and ensures that your project will behave in reproducible way.

We'll create a virtual environment called `venv` that will contain these packages
```
python3 -m venv venv
```
and activate your environment
 ```
source ./venv/bin/activate
 ```
To exit the virtual environment,
```
deactivate
```

## Manually install packages in your virtual environment

Once your virtual environment has been activated, you can install packages with
```
pip3 install pyyaml defopt pytest
```
You can check that the packages were correctly installed, e.g.
```
python3 -c "import yaml"
```
to check that `pyyaml` has been installed (you should not get an error).

## How to record all the installed packages

While our project has only a few dependencies, large porjects often have 10s if not 100s of dependecies 
and it becomes critical in this case to store the current environment in a file, `requirement.txt`, which 
can be loaded at a later time to recover the exact same environment. 

To freeze the environment, 
```
pip3 freeze > requirements.txt
```
The `requirements.txt` file will contain a list of packages, including the  
dependencies our dependencies depend on, with their version number.

To install the dependencies
```
pip3 install -r requirements.txt
```

> ## Exercises

> * Add a new dependency, e.g. `numpy`, install it manually using `pip3` and save that new dependency in `requirements.txt`
> * Exit your virtual environment, reactivate your environment and install all the dependencies. Check that `numpy` has been installed.
