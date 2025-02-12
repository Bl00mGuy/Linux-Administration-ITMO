#!/bin/bash
# Task 12: Создает пользователя u2 с паролем 87654321

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_12.sh необходимо запускать от имени root." >&2
    exit 1
fi

u2_pass=$(openssl passwd "87654321")
useradd -m -p "$u2_pass" u2

exit 0
