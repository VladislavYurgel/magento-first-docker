#!/bin/bash

# Set the URL of the ZIP file to download
zip_url="https://github.com/OpenMage/magento-mirror/archive/1.9.4.0.zip"

# Set the name of the ZIP file to download
zip_file="1.9.4.0.zip"

# Set the name of the destination folder to extract the ZIP file to
destination_folder="src"

# Download the ZIP file using wget
wget $zip_url

# Check if the download was successful and if the file exists
if [ ! -f "$zip_file" ]; then
    echo "Download failed, file not found"
    exit 1
fi

# Extract the ZIP file to the specified destination folder
unzip -o $zip_file -d $destination_folder

# Check if the extraction was successful
if [ $? -eq 0 ]; then
    echo "Extraction successful"
else
    echo "Extraction failed"
    exit 1
fi

# Delete the downloaded ZIP file
rm $zip_file

# Extract the required magento folder sources
mv ./src/magento-mirror-1.9.4.0/* ./src
rm -rf ./src/magento-mirror-1.9.4.0
sudo chmod -R 777 ./src

echo "Done"