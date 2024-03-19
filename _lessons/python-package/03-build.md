---
layout: post
title: Building your Python package and its dependencies
permalink: /python-package/build
chapter: python-package
---

## Objectives

You will learn how to build a Python package. 

* 1
* 2

## The pyproject.toml file

We'll assume that your project, for simplicity, contains two files. File `src/my_little_package/talk.py`:
```python
def greeting(name: str):
    """Greet the person named

    :param name: person to be greeted
    """
    print(f"Hello {name}!")
```
and file `src/my_little_package/cli.py`
```python
import defopt
from my_little_package.talk import greeting

def main():
    defopt.run(greeting)
```


Create a `pyproject.toml` file that contains the list of build tools, describes the project, lists the build dependencies, the scripts and other metadata. An example is shown below:
```
[build-system]
requires = ["setuptools>=64",]
build-backend = "setuptools.build_meta"

[project]
name = "my_little_package"
description = "a minimal package example"
readme = "README.md"
license = {file = "LICENSE"}
authors = [
    { name = "John Doe", email = "john.doe@ewiury.com.nz" },
]
dependencies = [
    "pyyaml",
    "defopt",
]

[project.optional-dependencies]
test = ["pytest"]
dev = [
    "my_little_package[test]",
    "ruff",
    "pdbpp",
    "pyinstrument"
]

[project.scripts]
mlp = "my_little_package.cli:main"

[tool.ruff]
select = ["E", "F"]
ignore = ["E203"]
extend-exclude = [".ipynb_checkpoints"]
```

Note the line `mlp = "my_little_package.cli:main"` under the `project.scripts` section. This entry tells the build system to generate a command `mlp`, which maps to the `main` function of `cli.py` script under `my_little_package`. 


## How to build your project

Type 
```
pip install -e .[dev]
```
to build your project. You should now have access to the script `mlp`. To check that the `mpl` script has been installed, type
```
mlp -h
```

> ## Exercises

> * Add a package version entry to the [pyproject.toml](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/) file under the `project` section
> * Consider making package version dynamically linked to the Git tag. This requires `setuptools_scm` in the `build-system` section in addition to `setuptools`. You will then need to set `dynamic = [version]` under `project`. 