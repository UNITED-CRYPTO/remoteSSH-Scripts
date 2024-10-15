#sudo apt update && sudo apt upgrade -y

if command -v make &> /dev/null
then
    echo "make уже установлен"
    make -v
else
    echo "make не найден. Устанавливаю..."
    sudo apt install make -y
    make -v
fi

echo "make version check"
make -v

if command -v screen &> /dev/null
then
    echo "screen уже установлен"
    screen -v
else
    echo "screen не найден. Устанавливаю..."
    sudo apt install screen -y
    screen -v
fi

echo "screen version check"
screen -v

#echo "Download and install Go"
#cd $HOME
#ver="1.21.3"
#wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
#sudo rm -rf /usr/local/go
#sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
#rm "go$ver.linux-amd64.tar.gz"
#echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
#source $HOME/.bash_profile

echo "go version check"
go version

#git clone https://github.com/carv-protocol/verifier.git
#cd verifier
#make build


#****************************** Работа в сессии Screen ********************************
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
    echo "Сессия $SESSION_NAME найдена."
    
    # Шаг 3: Проверяем, мертва ли сессия
    if is_session_dead; then
        echo "Сессия $SESSION_NAME имеет статус Dead, удаляю..."
        screen -wipe
        echo "Создаю новую сессию $SESSION_NAME..."
        screen -dmS $SESSION_NAME
    else
        echo "Сессия $SESSION_NAME активна."
    fi
else
    # Шаг 2: Если сессии нет, создаем новую
    echo "Сессия $SESSION_NAME не найдена, создаю новую..."
    screen -dmS $SESSION_NAME
fi

# Шаг 4: Проверка, что сессия живая
if check_session && ! is_session_dead; then
    echo "Сессия $SESSION_NAME успешно создана и активна."
    echo "Запускаем ноду"
    #screen -S carv -X stuff "/root/verifier/bin/verifier -private-key $PRIVATE_KEY -reward-address $REVARD_ADDRESS -commission-rate 1 > /root/verifier/log.txt 2>&1\n"
    echo "PRIVATE_KEY=$PRIVATE_KEY"
    echo "REVARD_ADDRESS=$REVARD_ADDRESS"
    echo "Попытка запустить ноду сделана, спим 60 сек..."
    #sleep 60
    echo "Выводим лог ноды"
    #tail -n100 /root/verifier/log.txt
else
    echo "Ошибка: Сессия $SESSION_NAME не активна."
fi

echo "Comlete!"
