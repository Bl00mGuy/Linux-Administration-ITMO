#!/bin/bash
# Task 2: Добавляет в work3.log строку с датой последней смены пароля для пользователя root

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_2.sh необходимо запускать от имени root." >&2
    exit 1
fi

last_change=$(chage -l root | grep "Last password change" | cut -d: -f2- | sed 's/^ //')
echo "Root password last changed on: $last_change" >> work3.log

exit 0
