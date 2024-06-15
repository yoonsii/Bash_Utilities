#!/bin/bash

# params
# 1 - string to uncomment
# 2 - filename

# Note - What happens if there are double quotes in the string?

sudo sed -i "s/^#\(${1}\)$/\1/" ${2}
