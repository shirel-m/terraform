#!/bin/bash
echo "{ \"url\": \"$(aws s3 presign s3://$1/$2 --expires-in 240)\" }"