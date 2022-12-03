#!/bin/bash

mdutil -i off /
rm -rf /.Spotlight-V100
rm -rf /.Spotlight-V200
mdutil -i on /
mdutil -E /

# Following line should go via CD instead of echo.
echo "Spotlight indexes removed and reindexing started. It might be a good idea to restart now. Please allow Spotlight indexes to finish rebuilding without interruption."