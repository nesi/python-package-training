---
layout: post
title: Building your Python package and its dependencies
permalink: /python-package/build
chapter: python-package
---

## Objectives

Sooner or later you will want to expose the functionality of your project to other users. This functionality could be in the form of scripts or modules the users will need to import. To achieve this you will need to build your package. 

## An example porject

We'll assume that your project, for simplicity, contains two files. File `src/my_little_package/talk.py`:
```python
def greeting(name: str):
    """Greet the person named

    :param name: person to be greeted
    """
    print(f"Hello {name}!")
```
and file `src/my_little_package/cli.py`:
```python
import defopt
from my_little_package.talk import greeting

def main():
    defopt.run(greeting)
```

Together, these files will expose the `talk` function and the `cli.py` script.

## The pyproject.toml file

To build the project, we need to provide additional information about the project. This additional information is captured in a `pyproject.toml` file.

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
    { name = "John Doe", email = "john.doe@strangeuni.edu.nz" },
]
dependencies = [
    "pyyaml",
    "defopt",
]

[project.scripts]
mlp = "my_little_package.cli:main"

```

Note the line `mlp = "my_little_package.cli:main"` under the `project.scripts` section. This entry tells the build system to generate a command `mlp`, which maps to the `main` function of `cli.py` script under `my_little_package`. 


## How to build your project

Type 
```
pip install -e .[dev]
```
to build your project. This will also build any dependencies required by the package. Option `-e` makes the installation editable, i.e. it will pick up any changes you make. You won't have to install again if you change the code.

You should now have access to `my_little_package` module; command
```
python -c "import my_little_package"
```
should not produce any errors. In addition, check that the `mpl` script has been installed by typing
```
mlp -h
```


> ## Exercises

> * Add a package version entry to the [pyproject.toml](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/) file under the `project` section
> * Consider making the package version dynamically linked to the Git tag inthe repository. This requires `setuptools_scm` in the `build-system` section in addition to `setuptools`. You will then need to set `dynamic = [version]` under `project` and add a section `[tool.setuptools_scm]`, which you can leave empty.