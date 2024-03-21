---
layout: post
title: Structuring your Python package
permalink: /python-package/structure
chapter: python-package
---

## Objectives

The structure of your project is important. It starts with choosing a good project name, having certain files present in your project (and others not!), and arranging the code in ways that are representative of the source files' dependencies. At the minimum, the repository should contain:

 * A readme file
 * A license file

> NOTE:
> Github can automatically create a repository with these files populated.
  
## The readme file

This file tells users what your project is about, how to build and use your project. We recommend calling this file `README.md` and using the [markdown](https://www.markdownguide.org/basic-syntax/) formatting to populate the file. The basic layout could be:

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

This file describes what users can and cannot do with your project. Use the `MIT License` if you want to apply as few restrictions as possible. 
> NOTE: Be aware that some open-source licenses don't allow software to be sold or impose other conditions.

## The .gitignore file

This file specifies which files and directories should not be tracked by Git. Examples are temporary files, virtual environments, etc. An example of `.gitignore` is

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

You're now able to populate your project. We recommend to put your Python code under `src/<package_name>`. 

If data are present these could be under `data/`. However, refrain from adding large data files to your project. 

Tests should go under `tests/`.

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
