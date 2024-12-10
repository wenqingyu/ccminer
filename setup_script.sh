#!/bin/bash

# Step 2: Install necessary dependencies
echo "Installing required dependencies..."
sudo apt update
sudo apt install -y git libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential


# Step 3: Install NVIDIA CUDA Toolkit
echo "Installing NVIDIA CUDA Toolkit..."
sudo apt install -y nvidia-cuda-toolkit

# Step 4: Verify CUDA installation
echo "Verifying CUDA installation..."
nvcc --version

# Step 1: Initialize repository and switch to the 'linux' branch
echo "Initializing repository and checking out 'linux' branch..."
git checkout linux

# Step 5: Build the project
echo "Building the project..."
./build.sh

# Step 6: Set up environment variables for CUDA
echo "Setting up CUDA environment variables..."
echo 'export LD_LIBRARY_PATH=/opt/conda/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

# Step 7: Verify ccminer version
echo "Verifying ccminer installation..."
./ccminer --version

echo "Setup completed successfully."
