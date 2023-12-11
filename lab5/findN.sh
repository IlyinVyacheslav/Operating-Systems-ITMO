#!/bin/bash

# Инициализация переменных
min=0
max=2500
result=0

while [ $min -le $max ]; do
    mid=$(( (min + max) / 2 ))

    # Запуск скрипта start с аргументом $mid
    ./newrunner.sh $mid
    while top -bn1 | grep -q 'newmem.bash'; do
        if dmesg | tail -n 20 | grep "newmem.bash"; then
            # Если обнаружено аварийное завершение, прерываем цикл
            break
        fi
        sleep 1
    done

    # Проверяем, упал ли скрипт, используя dmesg
    if dmesg | grep "newmem.bash"; then
        # Если хоть один скрипт упал, уменьшаем максимальное значение
        max=$(( mid - 1 ))
    else
        # Если скрипты не упали, увеличиваем минимальное значение
        result=$mid
        min=$(( mid + 1 ))
    fi

    # Убиваем все запущенные скрипты newmem.bash
    pkill -f newmem.bash
    sudo dmesg -c > /dev/null

    # Пауза перед следующей итерацией
    sleep 1
    echo "current: $result"
done

echo "Максимальное безопасное значение N: $result"
