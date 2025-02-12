#!/bin/bash
# Task 5: Создает пользователя u1 с паролем 12345678

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_5.sh необходимо запускать от имени root." >&2
    exit 1
fi

u1_pass=$(openssl passwd "12345678")
useradd -m -p "$u1_pass" u1

exit 0
