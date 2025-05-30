#!/bin/bash

# check user interface

# faketty COMMAND
faketty() {
    if command -v unbuffer > /dev/null; then
        # for macos (brew install expect)
        unbuffer -p $@
    else
        script -eqfc "$(printf "%q " "$@")" /dev/null
    fi
}

set -ve

< /dev/null ./duplicut 2>&1 | grep -q '^error: mandatory argument: --outfile$'

faketty ./duplicut > /dev/null
./duplicut --help > /dev/null

./duplicut --unexistent-argument 2>&1 | grep -q "unrecognized"

! ./duplicut --version > /dev/null
./duplicut --version | grep -Eq "duplicut.+github"

# -l max value is 4095
./duplicut /etc/passwd -o /tmp/x -l 4095 &> /dev/null
! ./duplicut /etc/passwd -o /tmp/x -l 4096 &> /dev/null
./duplicut /etc/passwd -o /tmp/x -l 4096 2>&1 | grep -q "max value is 4095"

# -c can't be used together with -C (lowere/upper case)
./duplicut /etc/passwd -o /tmp/x -c &> /dev/null
./duplicut /etc/passwd -o /tmp/x -C &> /dev/null
! ./duplicut /etc/passwd -o /tmp/x -c -C &> /dev/null
./duplicut /etc/passwd -o /tmp/x -c -C 2>&1 | grep -q "cannot use '--lowercase' and '--uppercase' together"
