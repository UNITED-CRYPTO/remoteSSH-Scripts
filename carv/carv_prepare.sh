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

cd verifier/bin/

screen -dmS carv
screen -S carv -X stuff 'echo "Hello from inside screen!"\n'


echo "Comlete!"
