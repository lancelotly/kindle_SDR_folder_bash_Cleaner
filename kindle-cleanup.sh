#!/bin/bash

handle_clean_path() {
    echo "Scanning $path..."

    file_names=$(find "$path" -maxdepth 1 -type f -not -path '*/\.*' -exec sh -c 'echo "${0##*/}" | cut -f1 -d\.' {} \; | sort)
    dir_names=$(find "$path" -maxdepth 1 -type d -name "*.sdr" -not -path '*/\.*' -exec sh -c 'echo "${0##*/}" | cut -f1 -d\.' {} \; | sort)

    echo ""
    echo "files: Found $(echo "$file_names" | wc -l) book files."
    echo "${file_names[@]} "
    echo "_____________________"
    echo ""
    echo "dirs: Found $(echo "$dir_names" | wc -l) .sdr directories."
    echo "${dir_names[@]} "
    echo "_____________________"
    echo ""

    dirs_to_remove=$(comm -23 <(echo "$dir_names") <(echo "$file_names"))
    
    if ! [ -z "$dirs_to_remove" ]; then
        echo "dirs_to_remove:"
        echo "${dirs_to_remove[@]}"
        read -p "Do you want to delete the useless directories? (y/n) " confirm
        if [[ "$confirm" == "y" ]]; then
            echo "$dirs_to_remove" | sed 's/$/.sdr/' | tee -a "$path"/removed_folders.txt | tr '\n' '\0' | xargs -0 -I{} rm -r "$path/{}"
        fi
        echo -e "Useless .sdr folders have been removed, see \'$path/removed_folders.txt' for details."
    else 
        echo "All clear! Nothing needs to be cleaned."
    fi
}

read -p "Input Kindle Volume Path: " path
path=${path//\'/} # Remove single quotes
handle_clean_path "$path"
