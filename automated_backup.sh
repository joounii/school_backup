auto_updated () {
    echo "$(cyan "Automation setup started")"

    rm ./path_backup_folder.txt
    rm ./path_folder_to_copy.txt

    get_backup_folder
    get_folder_to_copy

    echo "$backup_folder" > ./path_backup_folder.txt
    echo "$folder_to_copy" > ./path_folder_to_copy.txt

    echo "$(cyan "Automation setup completed")"
}

auto () {
    if test -f "./path_backup_folder.txt" && test -f "./path_folder_to_copy.txt"; then
        backup_folder=$(cat path_backup_folder.txt)
        folder_to_copy=$(cat path_folder_to_copy.txt)
        if [ -d "$backup_folder" ] && [ -d "$folder_to_copy" ]; then
            echo "$(cyan "Automatic backup started from $folder_to_copy to $backup_folder")"
        else
            echo "$backup_folder$(yellow " directory does not exists. Starting Automation setup...")"
            auto_updated
        fi
    else
        echo "$(cyan "Automation setup started")"
        get_backup_folder
        get_folder_to_copy

        echo "$backup_folder" > ./path_backup_folder.txt
        echo "$folder_to_copy" > ./path_folder_to_copy.txt

        echo "$(cyan "Automation setup completed")"
    fi
}