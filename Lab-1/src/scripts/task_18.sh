#!/bin/bash
# Task 18: Настраивает sudo таким образом, чтобы пользователь u1 мог менять пароли других пользователей (sudo passwd),
# но не мог выполнять другие команды от имени root.

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_18.sh необходимо запускать от имени root." >&2
    exit 1
fi

echo "u1 ALL=(root) NOPASSWD: /usr/bin/passwd" > /etc/sudoers.d/u1-passwd
chmod 440 /etc/sudoers.d/u1-passwd

exit 0
