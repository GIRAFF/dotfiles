#!/bin/bash

cat $(find ~/opt/motds/ -type f | shuf -n 1) > /etc/motd
