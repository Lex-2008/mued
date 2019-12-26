#!/bin/sh

# Set this to '-r' in order to run ed in 'restricted' mode (limited to editing
# files in a single dir with no option to run shell commands).
# Leave it empty to have a backdoor.
RESTRICTED='-r'

echo "HTTP/1.0 200 OK"
echo

data="$(busybox httpd -d "$(cat)" | tr -d '\r')"
data="${data#t=}"

cd ../data
touch data.txt # make sure the file exists
(
  echo "$data"
  echo 'w'
  # sed deletes first and last lines of ed output - that is, number of bytes in
  # the file when it's opened and when it's saved.
  ) | ed $RESTRICTED -v data.txt 2>&1 | sed '1d;$d'
