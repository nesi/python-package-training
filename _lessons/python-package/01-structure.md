---
layout: post
title: Creating your Python package structure
permalink: /python-package/structure
chapter: python-package
---

## Objectives

The structure of your project is important. It starts with choosing a good project name, having certain files present in your project and arranging the code in ways that are representative of the source files' dependencies. At the minimum, the repository should contain a:

 * readme file
 * license file

 Github can automatically create a repository with these files populated.
  
## The readme file

This file tells users what your project is about, how to build and use your project. We recommend calling this file `README.md` and using the [markdown](https://www.markdownguide.org/basic-syntax/) formatting to populate the file. The basic layout is 

```markdown
# Title

Description of the package

## How to build the package

Provide build instructions

## Example

Show how to use your package

## How to test the package

Provide the command to test your package
```


## The license file

This file describes the list of usage restrictions associated with your project. Use the `MIT License` if you want to apply as few as possible restrictions. Other open-source licenses don't allow software to be sold or impose other conditions.

## The .gitignore file

This file specifies which files and directories should not be tracked by Git. Example are temporary files, virtual environments, etc. An example of `.gitignore` is

```
# python
__pycache__
*.egg-info
.idea

# ipython
.ipynb_checkpoints

# virtual environment
venv
```

## Source files

You're now able to populate your project. We recommend to put your Python code under `src/<package_name>`. If data are present these could be under `data/`. Tests should go under `tests/`.

```
├── LICENSE
├── README.md
├── data
├── src
│   └── my_little_package
└── tests
```


> ## Exercise

> * Create a mock project and populate the project with `README.md`, `LICENSE` and `.gitignore` files.
