---
layout: post
title: Setting up continuous integration
permalink: /python-package/continuous-integration
chapter: python-package
---

## Objectives

You will learn:

 * what continuous integration is
 * how continuous integration can preserve software quality

## What is continuous integration (CI)?

Continuous integration describes the process integrating code changes into a software from multiple developers. Automated tools are used to assert that the code changes do not break the software. These
tools are used in conjunction with unit tests and source version control.

## How to set up CI

GitHub and other source code repositories can be configured to run tests each time changes are pushed to the repository. In the case of GitHub, you can write a file `ubuntu.yml` under `.github/workflows`, which contains
```YAML
name: Python package
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ["3.11", "3.12"]
    steps:
      - uses: actions/checkout@v4
      - name: Set up Python
        # This is the version of the action for setting up Python, not the Python version.
        uses: actions/setup-python@v4
        with:
          # Semantic version range syntax or exact version of a Python version
          python-version: '3.x'
      - name: Display Python version
        run: python -c "import sys; print(sys.version)"
      - name: Install dependencies
        run: pip install -e .[test]
      - name: Run tests
        run: pytest
```
In this example, GitHub Actions are run each time the code is `push`ed. Ubuntu virtual machines are built with two versions of Python (3.11 and 3.12). The test dependencies are installed with `pip install -e .[test]` andthe code is run with `pytest`. 

In general, there could be several `yml` files under `.github/workflows`, the actions of all files will be executed.

> ## Exercises

> * Create another GitHub Actions file `windows.yml`, which tests the code under Windows.
> * Add a step that checks the compliance of the source code' formatting using the `ruff` tool