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

echo "go version check"
go version

echo "Comlete!"
