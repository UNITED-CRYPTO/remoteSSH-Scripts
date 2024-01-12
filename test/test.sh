#touch test.txt 2> /dev/null
#if [ $? -eq 0 ]
#then
#  echo "Successfully created file"
#else
#  echo "Could not create file" >&2
#fi
#echo "Hello world!"
#set
#$HOME/.cargo/bin/bazuka init --mnemonic "$TEST"
#echo "printenv from bash"
#source ~/.bash_profile
echo -e "
 _____                     _                ____   ____   _   _ 
|  _  \  __   _  _   __   | |   __    __   /   _\ /   _\ | |_| |
| | ) / / _\ | \/ | / _\ |   | / _\  |__|  \__  \ \__  \ |  _  |
|_| \_\ \__\ |_||_| \__/  |_|  \__\        \____/ \____/ |_| |_|"
#echo "printenv from bash" && printenv
#bazuka node status | grep -e "version" -e "height" -e "network"

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
go version
