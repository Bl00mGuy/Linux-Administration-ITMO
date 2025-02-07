#!/bin/bash

ls -Fal /etc > ~/test/list

if [ $? -ne 0 ]; then
	exit 1
fi