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
#printenv
echo "Print .bash_profile from remoteSSH" && cat .bash_profile
echo "Print .profile from remoteSSH" && cat .profile
echo "Print $HOME/.cargo/env" && cat $HOME/.cargo/env
