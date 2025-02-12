#!/bin/bash
# Task 3: Добавляет в work3.log список всех групп (только имена групп) через запятую

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_3.sh необходимо запускать от имени root." >&2
    exit 1
fi

groups_list=$(cut -d: -f1 /etc/group | paste -sd, -)
echo "Groups: $groups_list" >> work3.log

exit 0
