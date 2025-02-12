#!/bin/bash
# Task 15: Создает каталог /home/test14, в который любой пользователь может записывать данные,
# но удалять файлы сможет только их создатель или пользователь u1.

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_15.sh необходимо запускать от имени root." >&2
    exit 1
fi

mkdir -p /home/test14
chown u1: /home/test14
chmod 1777 /home/test14

exit 0
