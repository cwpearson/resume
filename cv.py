#!/usr/bin/env python

"""
Pandoc filter to remove every div marked with class 'remove'
"""

from pandocfilters import toJSONFilter, Emph, Para, Div

def remove(key, value, format, meta):
    if key == 'Div':
        [[ident, classes, kvs], contents] = value
        if "resume" in classes and "cv" not in classes:
            return []

if __name__ == "__main__":
  toJSONFilter(remove)