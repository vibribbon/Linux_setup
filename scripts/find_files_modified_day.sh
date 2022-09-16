#!/bin/bash


find /home -type f -newerat "1 day ago" -printf "\n%AY-%Am-%Ad %AH:%AM:%AS %p" 2>/dev/null | less
