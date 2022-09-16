#!/bin/bash

# echo '-- EMPTY FILES IN /HOME ------------------------------------------'
find /home -type f -empty 2>/dev/null | fold -s -w 80 | less
