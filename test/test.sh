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

# Проверяем наличие и загружаем ~/.bashrc, если он существует
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Проверяем наличие и загружаем ~/.bash_profile, если он существует
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

echo "print PATH" && echo $PATH
