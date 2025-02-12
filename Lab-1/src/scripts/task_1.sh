#!/bin/bash
# Task 1: Выводит в файл work3.log список всех пользователей в формате "user <имя> has id <UID>"

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_1.sh необходимо запускать от имени root." >&2
    exit 1
fi

rm -f work3.log

awk -F: '{print "user " $1 " has id " $3}' /etc/passwd >> work3.log

exit 0
