# GO Install script. Please specify the newest version of GO (see https://go.dev/dl/)

echo "print PATH" && echo $PATH

echo "set ver" && ver="1.21.6"
echo "download go" && wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
echo "rm old go ver" && sudo rm -rf /usr/local/go
echo "unpack go" && sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
echo "del arch" && rm "go$ver.linux-amd64.tar.gz"
#echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
echo "export PATH to .profile" && echo "export PATH=\$PATH:/usr/local/go/bin" >>~/.profile
echo "export work PATH to .profile" && echo "export PATH=\$PATH:\$(go env GOPATH)/bin" >>~/.profile
source ~/.profile

echo "print PATH" && echo $PATH

go version
