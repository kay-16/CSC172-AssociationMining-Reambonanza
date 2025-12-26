#!/bin/bash

# Script to download large data/rule files for the ARM project.

echo "Warning! Large File... Starting data file download for Association Rule Mining project..."

# Define the destination directory (where the ARM data lives)
DEST_DIR="data" # Assuming you have a 'data/' directory in your ARM project

# Create the data directory if it doesn't exist
mkdir -p $DEST_DIR

# Downloadable link
DOWNLOAD_URL="https://drive.google.com/uc?export=download&id=1yeDccVWgspjnEFz60dp_fxVoWiuDC8TQ"

# Define the file name
ZIP_FILE="project_arm_data.zip"

# Download the ZIP file
echo "Downloading $ZIP_FILE..."
# Ensure you use your ARM data download link here
wget --no-check-certificate "$DOWNLOAD_URL" -O "$ZIP_FILE" 

# Unzip the files into the data/ directory
echo "Extracting data files into $DEST_DIR/..."
unzip -o "$ZIP_FILE" -d "$DEST_DIR"

# Clean up the temporary zip file
echo "Cleaning up temporary zip file..."
rm "$ZIP_FILE"

echo "Download and setup complete. The project data is ready to be mined or analyzed."