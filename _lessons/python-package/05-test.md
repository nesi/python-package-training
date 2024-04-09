---
layout: post
title: Testing your code
permalink: /python-package/test
chapter: python-package
---

## Objectives

You will learn:

* what unit tests are and why you should have them
* how to run all tests using a simple command

## Why testing?

Nobody likes testing. Yet almost every significant software has bugs and identifying these can be time consuming. By making testing an integral part of your code development process, you'll be able to find bugs and squash them faster.

## Writing unit tests

At the heart of software testing are unit tests. Ideally, a unit test exercises a single functionality of the software. The test should run fast -- long tests can also be useful but you may want to run them only sporadically.

Let's go back to our example application "my_little_package". Once installed, you should have a command `mpl`, which takes an string and prints out a greeting, installed. This command calls underneath a function `greeting`, which is is made available once `my_little_package` is imported. We could test the `mpl` command but we prefer to test the low level `greeting` call. 

To add a uinit test, create a file `test_talk.py` containing
```python
import pytest
from my_little_package import talk

def test_talk():
    talk.greeting('Adam')
```

Next, add the `pytest` dependency to the `pyproject.toml`, rebuild the project. Now run
```bash
pytest
```
You should see a message that says one test was run successfully.

> ## Exercises

> * Above, we only tested that the code ran. We didn't check whether the correct value was printed. Check that the correct string was written by applying the methods described under [Accessing captured output from a test function](https://docs.pytest.org/en/7.1.x/how-to/capture-stdout-stderr.html) 

