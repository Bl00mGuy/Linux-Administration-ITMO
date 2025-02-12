#!/bin/bash
# Task 16: Копирует в каталог /home/test14 исполняемый файл редактора nano и устанавливает setuid,
# чтобы при его запуске работали привилегии u1.

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_16.sh необходимо запускать от имени root." >&2
    exit 1
fi

cp /usr/bin/nano /home/test14/
chown u1: /home/test14/nano
chmod 4755 /home/test14/nano

exit 0
