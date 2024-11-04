#!/bin/bash
source .venv-$python_version/bin/activate

molecule create
