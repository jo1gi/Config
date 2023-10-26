#!/usr/bin/env bash
# Search for a dependency in maven dependency tree

mvn dependency:tree | rg -e '^' -e "$1"
