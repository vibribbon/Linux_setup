#!/bin/bash


find /home -type d -empty 2>/dev/null | fold -s -w 80 | less
