#!/bin/bash
# Task 17: Создает каталог /home/test15 и файл secret_file в нем.
# Настраивает права так, чтобы содержимое файла можно было прочитать, зная имя файла,
# но просмотр списка файлов в каталоге был невозможен.

if [[ $EUID -ne 0 ]]; then
    echo "Скрипт task_17.sh необходимо запускать от имени root." >&2
    exit 1
fi

mkdir -p /home/test15
echo "This is a secret file." > /home/test15/secret_file

# Для каталога задаем права 711 (доступ к файлам возможен, но их просмотр запрещен)
chmod 711 /home/test15
# Файл делаем читаемым для всех (но без прав на выполнение)
chmod 644 /home/test15/secret_file

exit 0
