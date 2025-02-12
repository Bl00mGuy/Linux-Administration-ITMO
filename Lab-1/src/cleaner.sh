#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт необходимо запускать от имени root."
    exit 1
fi

echo "Удаляем пользователей u1, u2 и myuser (если существуют)..."
for user in u1 u2 myuser; do
    if id "$user" &>/dev/null; then
        userdel -r "$user"
        echo "Пользователь $user удалён."
    fi
done

echo "Удаляем группы g1 и test13grp (если существуют)..."
for group in g1 test13grp; do
    if getent group "$group" >/dev/null; then
        groupdel "$group"
        echo "Группа $group удалена."
    fi
done

echo "Удаляем файл /etc/skel/readme.txt, если он содержит 'Be careful!'..."
if [ -f /etc/skel/readme.txt ]; then
    if grep -q "Be careful!" /etc/skel/readme.txt; then
        rm -f /etc/skel/readme.txt
        echo "/etc/skel/readme.txt удалён."
    fi
fi

echo "Удаляем рабочий лог и созданные каталоги..."
rm -f work3.log
for dir in /home/test13 /home/test14 /home/test15; do
    if [ -d "$dir" ]; then
        rm -rf "$dir"
        echo "Каталог $dir удалён."
    fi
done

echo "Удаляем sudoers файл /etc/sudoers.d/u1-passwd..."
if [ -f /etc/sudoers.d/u1-passwd ]; then
    rm -f /etc/sudoers.d/u1-passwd
    echo "Файл /etc/sudoers.d/u1-passwd удалён."
fi

echo "Очистка завершена."
