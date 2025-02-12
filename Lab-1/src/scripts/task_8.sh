#!/bin/bash
# Task 8: Добавляет в work3.log сведения об идентификаторе и группах пользователя u1

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_8.sh необходимо запускать от имени root." >&2
    exit 1
fi

id u1 >> work3.log

exit 0
