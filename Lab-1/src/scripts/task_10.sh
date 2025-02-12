#!/bin/bash
# Task 10: Добавляет в work3.log перечень пользователей в группе g1 через запятую

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_10.sh необходимо запускать от имени root." >&2
    exit 1
fi

g1_users=$(getent group g1 | awk -F: '{print $4}')
echo "Users in group g1: $g1_users" >> work3.log

exit 0
