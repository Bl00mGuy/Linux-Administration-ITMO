#!/bin/bash
# Task 9: Добавляет пользователя myuser в группу g1. Если пользователь отсутствует, создает его.

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_9.sh необходимо запускать от имени root." >&2
    exit 1
fi

if id "myuser" &>/dev/null; then
    usermod -a -G g1 myuser
else
    useradd -m myuser
    usermod -a -G g1 myuser
fi

exit 0
