#!/bin/bash

cut -d':' -f 1,3,6 /etc/passwd | tr ':' ' '
