#!/bin/bash
# Task 6: Создает группу g1

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_6.sh необходимо запускать от имени root." >&2
    exit 1
fi

groupadd g1

exit 0
