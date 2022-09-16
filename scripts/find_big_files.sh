#!/bin/bash

sudo find / -size +20M 2>/dev/null -exec ls -1hSs {} + | grep -E -v '^   0' |fold -s -w 80 | less
