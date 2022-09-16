#!/bin/bash

# find duplicate filenames only
# %f requrns filename, uniq -dc redurns duplicates (d) and the count(c)
find /home -type f -printf "%f\n" | sort | uniq -dc | less
