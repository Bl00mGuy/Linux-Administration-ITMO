#!/bin/bash
# Task 14: Настраивает права доступа для каталога /home/test13 и файлов в нем:
# пользователи u1 и u2 могут просматривать и читать файлы,
# изменять и удалять файлы может только u1,
# а выполнение файлов запрещено.

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_14.sh необходимо запускать от имени root." >&2
    exit 1
fi

# Создаем группу test13grp, если она еще не создана
if ! getent group test13grp > /dev/null; then
    groupadd test13grp
fi

# Добавляем u1 и u2 в группу test13grp
usermod -a -G test13grp u1
usermod -a -G test13grp u2

# Изменяем владельца каталога и файлов
chown u1:test13grp /home/test13
chown u1:test13grp /home/test13/work3-1.log /home/test13/work3-2.log

# Для каталога: 750 (u1 — полный доступ, группа — чтение и выполнение, остальные — нет доступа)
chmod 750 /home/test13

# Для файлов: 640 (u1 — чтение/запись, группа — только чтение, остальные — нет доступа)
chmod 640 /home/test13/work3-1.log /home/test13/work3-2.log

exit 0
