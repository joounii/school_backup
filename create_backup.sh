create_backup () {
    echo "$(cyan "Creating backup...")"

    # backup_folder=E:/test_backup
    # folder_to_copy=C:/schule_BBW/Modul_122/school_backup/sample_data
    date_time=$(date +"%F"_"%T" | sed 's/:/-/g')  || error_handling
    new_folder_path=$backup_folder/$date_time || error_handling

    mkdir $new_folder_path || error_handling

    cp -r $folder_to_copy $new_folder_path || error_handling

    echo "$(cyan "Finished backup")"
}

error_handling () {
    echo "$(red "There was an error while trying to create the backup")"
    exit 1
}
