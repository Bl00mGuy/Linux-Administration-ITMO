#!/bin/bash
# Task 11: Настраивает для пользователя u1 оболочку /usr/bin/mc (при входе в систему будет запускаться mc)

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_11.sh необходимо запускать от имени root." >&2
    exit 1
fi

usermod -s /usr/bin/mc u1

exit 0
