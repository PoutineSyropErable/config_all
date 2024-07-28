#!/bin/bash

# Function to get percentage of /home partition usage
get_home_partition_usage() {
  # Get the usage information for the /home partition and extract the percentage used
  local usage=$(df -h /home | awk 'NR==2 { print $5 }' | cut -d'%' -f1)
  echo "$usage"
}

# Call the function to get the percentage usage
percentage_used=$(get_home_partition_usage)

# Output the percentage usage
echo "$percentage_used%"
