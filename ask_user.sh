get_backup_folder () {
    read -ep "$(yellow "Please enter the path where you want to safe your backup: ")" backup_folder

    if [ -d "$backup_folder" ];
    then
        echo "$backup_folder$(cyan " directory exists.")"
    else
        echo "$backup_folder$(red " directory does not exists.")"
        get_backup_folder
    fi
}

get_folder_to_copy () {
    read -ep "$(yellow "Please enter the path to the folder you want to create a backup of: ")" folder_to_copy

    if [ -d "$folder_to_copy" ];
    then
        echo "$folder_to_copy$(cyan " directory exists.")"
    else
        echo "$folder_to_copy$(red " directory does not exists.")"
        get_folder_to_copy
    fi
}