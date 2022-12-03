#!/bin/sh 
touch ‘path to file/filename with extension’ 
printf 'Required Content' > ‘path to file/filename with extension’ 
cd path to file 
zip –r ‘filename.zip’ ‘filename with extension’ --password ‘zip file password’ 