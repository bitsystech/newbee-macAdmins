#!/bin/bash

dseditgroup -o edit -a $(stat -f "%Su" /dev/console) _lpoperator