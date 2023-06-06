create_backup () {
    echo "$(cyan "Creating backup...")"

    # backup_folder=E:/test_backup
    # folder_to_copy=C:/schule_BBW/Modul_122/school_backup/sample_data
    date_time=$(date +"%F"_"%T" | sed 's/:/-/g')
    new_folder_path=$backup_folder/$date_time

    mkdir $new_folder_path

    cp -r $folder_to_copy $new_folder_path

    echo "$(cyan "Finished backup")"
}
