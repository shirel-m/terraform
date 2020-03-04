#!/bin/bash

StorageAccount=$1
Container=$2
BlobName=$3

# install az
curl -sL https://aka.ms/InstallAzureCLIDeb | bash > /dev/null 2>&1
# end install az

az login --identity -u $ARM_CLIENT_ID > /dev/null 2>&1

end=`date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ'`
sas_token=$(az storage blob generate-sas --account-name $StorageAccount -c $Container -n $BlobName --permissions r --expiry $end --https-only)

echo "{ \"serviceSasToken\": $sas_token }"
