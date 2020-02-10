#!/bin/bash

StorageAccount=$1
Container=$2
BlobName=$3
BlobUrl=$4

# install az
sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

curl -sL https://packages.microsoft.com/keys/microsoft.asc | 
    gpg --dearmor | 
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | 
    sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-get update
sudo apt-get install azure-cli
# end install az

az login --identity -u $ARM_CLIENT_ID
if [[ $? -ne 0 ]] then
    &2 echo "az login failed"
fi

end=`date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ'`
sas=$(az storage blob generate-sas --account-name $StorageAccount -c $Container -n $BlobName --permissions r --expiry $end --https-only)
sas=$(sed -e 's/^"//' -e 's/"$//' <<<"$sas")
url=$BlobUrl?$sas

echo "{ \"url\": \"$url\" }"
