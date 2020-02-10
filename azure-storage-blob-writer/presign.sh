#!/bin/bash

StorageAccount=$1
Container=$2
BlobName=$3
BlobUrl=$4

az login --identity -u $ARM_CLIENT_ID

end=`date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ'`
sas=$(az storage blob generate-sas --account-name $StorageAccount -c $Container -n $BlobName --permissions r --expiry $end --https-only)
sas=$(sed -e 's/^"//' -e 's/"$//' <<<"$sas")
url=$BlobUrl?$sas

echo "{ \"url\": \"$url\" }"
