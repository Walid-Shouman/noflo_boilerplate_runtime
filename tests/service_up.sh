#!/bin/bash

PORT=3569
sudo lsof -i -P -n | grep LISTEN | grep $PORT

if [ $? -eq 0 ]
then
	echo "- Success: Service is available on port $PORT"
	exit 0
else
	echo "- Failure: Service is not available on port $PORT"
	exit 1
fi

