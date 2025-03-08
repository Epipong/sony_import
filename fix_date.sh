#!/bin/bash

if [ -f ".env" ]; then
    source .env
else
    echo ".env not found!"
    exit 0
fi

TARGET_PATH=/storage/6781-3667/Pictures/Sony

fix_date() {
    EXT=$1
    files=$(ls $TARGET_PATH/**/$EXT/*.$EXT)
    max=$(echo $files | wc -w)
    maxl=$(($(echo $max | wc -c)-1))
    i=1

    find "$TARGET_PATH" -type f -iname "*.$EXT" | while IFS= read -r filepath; do
        created_date=$(exiftool -d "%Y-%m-%d" -CreateDate -s3 "$filepath")
        filename=$(basename "$filepath")
        fixed_filename="$TARGET_PATH/$created_date/$EXT/$filename"

        parent_folder=$(basename "$(dirname "$(dirname "$filepath")")")

        parent_folder_wc=$(echo $parent_folder | wc -c)
        if [ "$parent_folder_wc" -gt "10" ]; then
            echo "$parent_folder_wc"
            echo "$parent_folder"
            continue
        fi

        target_folder="$TARGET_PATH/$created_date/$EXT"

        if [ ! -d $target_folder ]; then
            mkdir -p $target_folder
            printf "\e[36m$target_folder\e[0m directory has been created\n"
        fi

        if [ "$filepath" != "$fixed_filename" ]; then
            mv $filepath $fixed_filename
            printf "[%0${maxl}d/$max] \e[32m${filename}\e[0m has been moved to \e[32m${fixed_filename}\e[0m\n" $i
        else
            printf "[%0${maxl}d/$max] \e[32m${filename}\e[0m\n" $i
        fi
        i=$((i+1))
    done
}

fix_date ARW
