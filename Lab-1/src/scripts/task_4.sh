#!/bin/bash
# Task 4: Настраивает /etc/skel так, чтобы при создании нового пользователя в его домашнем каталоге создавался файл readme.txt с текстом "Be careful!"

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_4.sh необходимо запускать от имени root." >&2
    exit 1
fi

echo "Be careful!" > /etc/skel/readme.txt

exit 0
