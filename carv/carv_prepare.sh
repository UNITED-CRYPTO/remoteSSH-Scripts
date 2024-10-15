sudo apt update && sudo apt upgrade -y

if command -v make &> /dev/null
then
    echo "make уже установлен"
    make -v
else
    echo "make не найден. Устанавливаю..."
    sudo apt install make -y
    make -v
fi

echo "git check"
git version

echo "make version check"
make -v

echo "screen version check"
screen -v
