#!/bin/bash
# Task 7: Добавляет пользователя u1 в группу g1

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_7.sh необходимо запускать от имени root." >&2
    exit 1
fi

usermod -a -G g1 u1

exit 0
