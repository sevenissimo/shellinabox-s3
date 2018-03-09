#!/bin/env sed -r
# Blindly translate JSON to SCSS map variable.
#   1. unquote map keys
#   2. unquote colors
#   3. name the variable
#   4. rename the list
#   5. translate brackets
s|"([^"]+)":|\1:|
s|"(#[A-Za-z0-9]{6})"|\1|
s|^\{$|\$theme: {|
s|color:|colors:|
y|{[]}|(())|
