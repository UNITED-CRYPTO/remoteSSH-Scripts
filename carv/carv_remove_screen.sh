
cd verifier/bin/

# Название сессии
SESSION_NAME="carv"

# Функция для проверки, существует ли живая сессия
check_session() {
    screen -ls | grep -q "$SESSION_NAME"
}

# Функция для проверки, что сессия "Dead ???"
is_session_dead() {
    screen -ls | grep "$SESSION_NAME" | grep -q "Dead"
}

# Шаг 1: Проверка наличия сессии
if check_session; then
    echo "Сессия $SESSION_NAME найдена, проверяем статус..."
    
    # Шаг 3: Проверяем, мертва ли сессия
    if is_session_dead; then
        echo "ERROR: Сессия $SESSION_NAME имеет статус Dead, пробуем удалить.."
		screen -S $SESSION_NAME -X quit
        # screen -wipe
        # echo "Создаю новую сессию $SESSION_NAME..."
        # screen -dmS $SESSION_NAME
    else
        echo "Сессия $SESSION_NAME активна! Пробуем удалить.."
		screen -S $SESSION_NAME -X quit
    fi
else
    # Шаг 2: Если сессии нет
    echo "ERROR: Сессия $SESSION_NAME не найдена, удалять нечего."
    # screen -dmS $SESSION_NAME
fi

# Шаг 4: Проверка, что сессия живая
if check_session && ! is_session_dead; then
    echo "Сессия $SESSION_NAME в все еще активна! Пробуем удалить.."
	screen -S $SESSION_NAME -X quit
    #echo "Выводим лог ноды:"
    #tail -n100 /root/verifier/log.txt
else
    echo "ERROR: Сессия $SESSION_NAME не активна."
fi

echo "Comlete!"
