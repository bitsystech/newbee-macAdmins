#!/bin/sh
system_profiler SPPowerDataType | sed -n '/Charge Information:/,/System Power Settings:/p' | sed '$d'