#!/bin/bash
# Task 13: В каталоге /home создает каталог test13 и копирует в него work3.log под именами work3-1.log и work3-2.log

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_13.sh необходимо запускать от имени root." >&2
    exit 1
fi

mkdir -p /home/test13
cp work3.log /home/test13/work3-1.log
cp work3.log /home/test13/work3-2.log

exit 0
