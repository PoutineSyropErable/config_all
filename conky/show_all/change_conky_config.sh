#!/bin/bash

# Define the config file path
config_file="/home/francois/.config/conky/show_all/show_all_conf"

# Check if the config file exists
if [[ -f "$config_file" ]]; then
    # Extract the current alignment value
    current_alignment=$(grep -oP "alignment = '\K[^']+" "$config_file")

    # Separate the current alignment into y_coord and x_coord
    y_coord="${current_alignment%_*}"
    x_coord="${current_alignment#*_}"

    echo "Current alignment: y_coord='$y_coord', x_coord='$x_coord'"

    # Check the first argument for signals
    case "$1" in
        "shuffle_x")
            # Shuffle x_coord
            if [[ $x_coord == "left" ]]; then
                x_coord="right"
            else
                x_coord="left"
            fi
            echo "Shuffled x_coord to '$x_coord'"
            ;;
        "shuffle_y")
            # Shuffle y_coord
            if [[ $y_coord == "top" ]]; then
                y_coord="bottom"
            else
                y_coord="top"
            fi
            echo "Shuffled y_coord to '$y_coord'"
            ;;
        *)
            # Default behavior: shuffle both
            if [[ $y_coord == "top" ]]; then
                y_coord="bottom"
            else
                y_coord="top"
            fi

            if [[ $x_coord == "left" ]]; then
                x_coord="right"
            else
                x_coord="left"
            fi
            echo "Shuffled both: y_coord='$y_coord', x_coord='$x_coord'"
            ;;
    esac

    # Construct the new alignment
    new_alignment="$y_coord"_"$x_coord"

    # Use sed to modify the file
    sed -i "s/alignment = '[^']*'/alignment = '$new_alignment'/g" "$config_file"
    echo "Modified $config_file: Changed alignment to alignment = '$new_alignment'"
else
    echo "$config_file not found!"
fi
