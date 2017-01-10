#!/bin/bash

if [[ $# -ne 4 ]] ; then
  printf "Usage:\n"
  printf "  echo_dev_tcp <channel> <message> <host> <port>\n"
  exit 1
fi

echo -n "pub #$1 $2" > /dev/tcp/$3/$4
