. ./helpers/color.sh && echo OK || exit 1
. ./helpers/menu.sh && echo OK || exit 1
. ./ask_user.sh && echo OK || exit 1
. ./automated_backup.sh && echo OK || exit 1
. ./create_backup.sh && echo OK || exit 1

manuel () {
    get_backup_folder
    get_folder_to_copy
}

selected_item=0
menu_items=("$(magenta "Auto")" "$(magenta "Manuel")" "$(magenta "Change_automation_settings")")

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

create_backup