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

echo "print BASH" && echo $BASH

[ -f /etc/profile ] && { echo "sourcing /etc/profile"; source /etc/profile; }
[ -f /etc/bash.bashrc ] && { echo "sourcing /etc/bash.bashrc"; source /etc/bash.bashrc; }
[ -f ~/.bashrc ] && { echo "sourcing ~/.bashrc"; source ~/.bashrc; }
([ -f ~/.bash_profile ] && { echo "sourcing ~/.bash_profile"; source ~/.bash_profile; }) || ([ -f ~/.bash_login ] && { echo "sourcing ~/.bash_login"; source ~/.bash_login; }) || ([ -f ~/.profile ] && { echo "sourcing ~/.profile"; source ~/.profile; })

echo "print PATH" && echo $PATH
