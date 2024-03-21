---
layout: post
title: Documenting your code
permalink: /python-package/documentation
chapter: python-package
---


## Objectives

Documentation is an integral part of the software development cycle. It is used to describe the functionality of your software, 
specifically how to call your functions and apply your tools. Documentation must be: (1) correct, (2) concise and (3) clear. Here you'll learn

* how to use docstrings
* generate documentation for your users


## What are docstrings?

Docstrings are strings below the declaration of a function, class or module. Docstrings can be used to document the usage of the function, class or module. For example, function `talk` in file `src/my_little_package/talk.py` contains the docstring
```
    """Greet the person named

    :param name: person to be greeted
    """
```

Typing 
```python
import my_little_package.talk
help(my_little_package.talk)
```
returns that docstring (with additional information).

## Formatting your docstring

A docstring can be any text. However, to be able to automatically generate documentation from code we'll need to abide to some conventions. There are several docstrings formats, all of which describe the function (or class or module) and the arguments as well as the return 
value of the function, if any. We recommend the Sphynx format, which appears currently to be the most popular. Below is an example:
```python
def my_complex(x: float, y: float=0) -> complex:
    """Create complex number.

    :param x: real part
    :param y: imaginary part
    :return 
    """
    return x + 1j*y
```


## MkDocs

[MkDocs](https://realpython.com/python-project-documentation-with-mkdocs/) is a tool for generating documentation from Markdown files. Combined with [mkdocstrings](https://mkdocstrings.github.io/), MkDocs can automatically generate documention from Python code that uses Sphynx docstrings. 

Install MkDocs with
```
pip3 install mkdocs
pip3 install "mkdocstrings[python]"
pip3 install mkdocs-material
```
Next, generate template versions of `mkdocs.yml` and `docs/index.md` with the command
```
mkdocs new .
```

### mkdocs.yml

Edit `mkdocs.yml`:
```
site_name: my_little_package

theme:
  name: "material"

plugins:
  - mkdocstrings

nav:
  - my_little_package: index.md
  - reference.md
```

### reference.md

Then create a new file `reference.md` under `docs/`, which lists all the functions to document
```
::: src.my_little_package.talk
```
Here, we're documenting a single function `talk` inside package `my_little_package`, which is under the `src` directory. The syntax `:::` in Markdown indicates that we want to generate documentation from this function's docstring. 

To check that the docstring complies to one of the formats supported by `mkdocstrings`, it's a good idea to run the command:
```
python3 -m docstring src/my_little_package/talk.py
```
which should not return any errors.


## Now generate your documentation

Type
```
mkdocs serve
```
This will generate the HTML documentation. View the documentation at `http://127.0.0.1:8000/`.

> ## Exercises

> * Document the package by editing `docs/index.md`
> * Write a new function with a docstring. Edit the `docs/reference.md` file and regenerate the documentation