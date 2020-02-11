#!/bin/bash

StorageAccount=$1
Container=$2
BlobName=$3
BlobUrl=$4

# install az
curl -sL https://aka.ms/InstallAzureCLIDeb | bash
# end install az

end=`date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ'`
signed_url=$(az storage blob generate-sas --account-name $StorageAccount -c $Container -n $BlobName --permissions r --expiry $end --https-only --full-uri)

# signed_url already wrapped in ""
echo "{ \"url\": $signed_url }"
