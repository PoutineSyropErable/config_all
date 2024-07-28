#!/bin/bash

# Function to get GPU temperature
get_gpu_temperature() {
    nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits
}

# Function to get GPU memory usage
get_gpu_memory_usage() {
    nvidia-smi --query-gpu=memory.used,memory.total --format=csv,noheader,nounits
}

# Function to get GPU utilization
get_gpu_utilization() {
    nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits
}

# Get GPU details
temperature=$(get_gpu_temperature)
memory_usage=$(get_gpu_memory_usage)
utilization=$(get_gpu_utilization)

# Print the results
echo "NVIDIA GPU Temperature: $temperature°C"
echo "NVIDIA GPU Memory Usage: $memory_usage MiB"
echo "NVIDIA GPU Utilization: $utilization%"