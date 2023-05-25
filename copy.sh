. ./colors.sh
. ./menu.sh

get_backup_folder () {
    read -p "$(yellow "Please enter the path where you want to safe your backup: ")" backup_folder

    if [ -d "$backup_folder" ];
    then
        echo "$backup_folder$(cyan " directory exists.")"
    else
        echo "$backup_folder$(red " directory does not exists.")"
        get_backup_folder
    fi
}

get_folder_to_copy () {
    read -p "$(yellow "Please enter the path to the folder you want to create a backup of: ")" folder_to_copy

    if [ -d "$folder_to_copy" ];
    then
        echo "$folder_to_copy$(cyan " directory exists.")"
    else
        echo "$folder_to_copy$(red " directory does not exists.")"
        get_folder_to_copy
    fi
}

manuel () {
    get_backup_folder
    get_folder_to_copy
}

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

selected_item=0
menu_items=("$(magenta "Auto")" "$(magenta "Manuel")" "$(magenta "Change_manuel_settings")")

run_menu "$selected_item" "${menu_items[@]}"
menu_result="$?"

case "$menu_result"
in
    0)
        clear
        auto
        ;;
    1)
        clear
        manuel
        ;;
    2)
        clear
        auto_updated
        ;;
esac

echo "$(cyan "Creating backup...")"

# backup_folder=E:/test_backup
# folder_to_copy=C:/schule_BBW/Modul_122/school_backup/sample_data
date_time=$(date +"%F"_"%T" | sed 's/:/-/g')
new_folder_path=$backup_folder/$date_time

mkdir $new_folder_path

cp -r $folder_to_copy $new_folder_path

echo "$(cyan "Finished backup")"